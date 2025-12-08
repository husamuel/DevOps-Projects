import requests

scans = [
    ("gitleaks-report.json", "Gitleaks"),
    ("semgrep-report.json", "Semgrep JSON Report"),
    ("njsscan-report.json", "NJSScan JSON Report")
]

url = "https://mydefectdojo.com/api/v2/import-scan/"
api_key = "MY_API_KEY"
engagement_id = 1


for file_path, scan_type in scans:
    with open(file_path, "rb") as f:
        files = {"file": f}
        data = {"engagement": engagement_id, "scan_type": scan_type}
        headers = {"Authorization": f"Token {api_key}"}
        response = requests.post(url, headers=headers, files=files, data=data)
