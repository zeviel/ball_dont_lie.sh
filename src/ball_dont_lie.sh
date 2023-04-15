#!/bin/bash

api="https://www.balldontlie.io/api/v1"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_players() {
	# 1 - page: (integer): <page - default: 0>
	curl --request GET \
		--url "$api/players?page=${1:-0}" \
		--user-agent "$user_agent" \
		--header "content-type: application/json"
}

function get_teams() {
	# 1 - page: (integer): <page - default: 0>
	curl --request GET \
		--url "$api/teams?page=${1:-0}" \
		--user-agent "$user_agent" \
		--header "content-type: application/json"
}

function get_games() {
	# 1 - season: (integer): <season - default: current>
	# 2 - team_ids: (comma-separated integers): <team_ids - default: all>
	# 3 - start_date: (string in YYYY-MM-DD format): <start_date - default: none>
	# 4 - end_date: (string in YYYY-MM-DD format): <end_date - default: none>
	# 5 - page: (integer): <page - default: 0>
	curl --request GET \
		--url "$api/games?season=${1:-}&team_ids=${2:-}&start_date=${3:-}&end_date=${4:-}&page=${5:-0}" \
		--user-agent "$user_agent" \
		--header "content-type: application/json"
}

function get_game_details() {
	# 1 - game_id: (integer): <game_id>
	curl --request GET \
		--url "$api/games/${1}" \
		 --user-agent "$user_agent" \
		--header "content-type: application/json"
}
