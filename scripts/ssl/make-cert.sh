#!/bin/sh

dir=/etc/ssl


dir=/etc/ssl              # Where everything is kept
certs=$dir/certs            # Where the issued certs are kept
crl_dir=$dir/crl              # Where the issued crl are kept
database=$dir/index.txt        # database index file.
#unique_subject = no                    # Set to 'no' to allow creation of
                                        # several ctificates with same subject.
new_certs_dir=$dir/newcerts         # default place for new certs.

confdir=$dir
pubdir=$dir/public
private_dir=$dir/private

certificate=$pubdir/leoxia.pem        # The CA certificate
serial=$dir/serial           # The current serial number
crlnumber=$dir/crlnumber        # the current crl number
                                          # must be commented out to leave a V1 CRL
crl=$dir/crl.pem         		  # The current CRL
private_key=$private_dir/leoxia.key        # The private key
RANDFILE=$private_dir/.rand
default_keyfile=$private_dir/leoxia.key

new_certs_dir=$dir/newcerts

conffile=$confdir/openssl.cnf
pem_file=$pubdir/leoxia.pem
der_file=$pubdir/leoxia.der
csr_file=$pubdir/leoxia.csr
cert_file=$pubdir/leoxia.crt


# .csr This is a Certificate Signing Request. 
# Some applications can generate these for submission to certificate-authorities. 
# The actual format is PKCS10 which is defined in RFC 2986
# Includes the key details + certificate public key 

# .pem Defined in RFC's 1421 through 1424, this is a container format that may include 
# just the public certificate (such as with Apache installs, and CA certificate files 
# /etc/ssl/certs), or may include an entire certificate chain including public key,
#  private key, and root certificates.
# The name is from Privacy Enhanced Mail (PEM), a failed method for secure email 
# but the container format it used lives on, and is a base64 translation of the x509 ASN.1 keys. 
#

# .key This is a PEM formatted file containing just the private-key of a specific certificate and is merely a conventional name and not a standardized one. In Apache installs, this frequently resides in /etc/ssl/private. The rights on these files are very important, and some programs will refuse to load these certificates if they are set wrong.

# source : http://serverfault.com/questions/9708/what-is-a-pem-file-and-how-does-it-differ-from-other-openssl-generated-key-file

# what is useful is .key => .csr => .crt => .pem

# Generate the key used for cryptography (.key)

echo "01" > $dir/serial
touch $dir/index.txt

openssl genrsa 4096 -sha512 -x509 -days 3650 -rand /etc/hosts -out $private_key

openssl req -new -key $private_key -out $csr_file

openssl x509 -req -days 3650 -in $csr_file -signkey $private_key -out $cert_file

openssl x509 -in $certificate -outform DER -out $derfile

cp $certificate $pubdir/$(openssl x509 -noout -hash -in $certificate).0

cp $pubdir/leoxia.crt /var/www/leoxia.crt

service apache2 restart

