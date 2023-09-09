set -e

mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD <<EOF
use admin
db = db.getSiblingDB('platform')
db.createUser({
  user: 'mapi',
  pwd:  '$RANDOM_SECRET_STRING',
  roles: [{
    role: 'readWrite',
    db: 'platform'
  }]
})
EOF
