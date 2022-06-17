export API_SERVER="https://kubenetes.api.endpoint:6443"
export BEARER_TOKEN_FILE_PATH="path"
export CA_FILE_PATH="path"
export API_ENDPOINT=$(echo $API_SERVER | cut -d '/' -f 3 )