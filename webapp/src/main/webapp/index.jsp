<html>

<head>
    <title>DevOps Pipeline - Project Status</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            max-width: 800px;
            width: 100%;
            padding: 40px;
        }

        h1 {
            color: #667eea;
            font-size: 2.5em;
            margin-bottom: 10px;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 1.1em;
        }

        .status-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 30px 0;
        }

        .status-card {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            transition: transform 0.3s;
        }

        .status-card:hover {
            transform: translateY(-5px);
        }

        .status-card.active {
            background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
        }

        .status-icon {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .status-title {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .status-desc {
            font-size: 0.9em;
            color: #666;
        }

        .pipeline-status {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
        }

        .pipeline-status h2 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 1.5em;
        }

        .stage {
            display: flex;
            align-items: center;
            padding: 10px;
            margin: 10px 0;
            background: white;
            border-radius: 8px;
            border-left: 4px solid #84fab0;
        }

        .stage-number {
            background: #667eea;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-right: 15px;
        }

        .stage-info {
            flex: 1;
        }

        .stage-name {
            font-weight: bold;
            color: #333;
        }

        .stage-detail {
            font-size: 0.9em;
            color: #666;
        }

        .checkmark {
            color: #84fab0;
            font-size: 1.5em;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #eee;
            color: #666;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>🚀 DevOps Pipeline Status</h1>
        <p class="subtitle">Real-World Multi-Server CI/CD Implementation</p>

        <div class="status-grid">
            <div class="status-card active">
                <div class="status-icon">🛠️</div>
                <div class="status-title">Jenkins</div>
                <div class="status-desc">CI Server Active</div>
            </div>
            <div class="status-card active">
                <div class="status-icon">🐯</div>
                <div class="status-title">Tomcat</div>
                <div class="status-desc">Deployment Target</div>
            </div>
            <div class="status-card active">
                <div class="status-icon">🤖</div>
                <div class="status-title">Ansible</div>
                <div class="status-desc">Automation Hub</div>
            </div>
            <div class="status-card active">
                <div class="status-icon">🐳</div>
                <div class="status-title">Docker</div>
                <div class="status-desc">Container Host</div>
            </div>
        </div>

        <div class="pipeline-status">
            <h2>✅ Completed Stages</h2>

            <div class="stage">
                <div class="stage-number">1</div>
                <div class="stage-info">
                    <div class="stage-name">Infrastructure Setup</div>
                    <div class="stage-detail">4 Ubuntu EC2 instances configured and connected</div>
                </div>
                <span class="checkmark">✓</span>
            </div>

            <div class="stage">
                <div class="stage-number">2</div>
                <div class="stage-info">
                    <div class="stage-name">SSH Key Exchange</div>
                    <div class="stage-detail">Ansible passwordless authentication established</div>
                </div>
                <span class="checkmark">✓</span>
            </div>

            <div class="stage">
                <div class="stage-number">3</div>
                <div class="stage-info">
                    <div class="stage-name">Jenkins Configuration</div>
                    <div class="stage-detail">Plugins installed, tools configured, job created</div>
                </div>
                <span class="checkmark">✓</span>
            </div>

            <div class="stage">
                <div class="stage-number">4</div>
                <div class="stage-info">
                    <div class="stage-name">Maven Build & Tomcat Deploy</div>
                    <div class="stage-detail">WAR file built and deployed successfully</div>
                </div>
                <span class="checkmark">✓</span>
            </div>
        </div>

        <div class="footer">
            <p><strong>Project:</strong> Complete CI/CD Pipeline with Jenkins, Maven, Tomcat, Docker, Ansible &
                Kubernetes</p>
            <p style="margin-top: 10px; font-size: 0.9em;">Build Time: <%= new java.util.Date() %>
            </p>
        </div>
    </div>
</body>

</html>