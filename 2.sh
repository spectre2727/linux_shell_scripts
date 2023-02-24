if [ $# -lt 4 ]; then
  echo "Script needs four arguments to run"
  echo "1. git username"
  echo "2. git email"
  echo "3. github ssh key name"
  echo "4. docker ubuntu codename (e.g. jammy)"
  exit 1
fi

username=$1
email=$2
keyname=$3

sh git.sh ${username} ${email} ${keyname}
returncode=$? && echo "${returncode}\n"

if [ ${returncode} -gt 0 ]; then
  echo "Git installation error"
  exit 1
fi

echo "== Git installed ==\n"

codename=$4

sh docker.sh ${codename}
returncode=$? && echo "${returncode}\n"

if [ ${returncode} -gt 0 ]; then
  echo "Docker installation error"
  exit 1
fi

echo "== Docker installed ==\n"

