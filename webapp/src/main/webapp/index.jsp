<html>

<head>
    <title>DevOps Pipeline - Stage Progress</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: white;
            border-radius: 15px;
            padding: 40px;
            max-width: 900px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
        }

        h1 {
            color: #667eea;
            text-align: center;
            margin-bottom: 30px;
        }

        .stage {
            background: #f8f9fa;
            border-left: 5px solid #28a745;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
        }

        .stage.pending {
            border-left-color: #6c757d;
            opacity: 0.6;
        }

        .stage-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .stage-number {
            background: #667eea;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 1.2em;
            margin-right: 15px;
        }

        .stage-title {
            font-size: 1.3em;
            font-weight: bold;
            color: #333;
            flex: 1;
        }

        .status-badge {
            background: #28a745;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9em;
        }

        .status-badge.pending {
            background: #6c757d;
        }

        .stage-details {
            margin-left: 55px;
            color: #555;
            line-height: 1.6;
        }

        .stage-details ul {
            margin: 10px 0;
            padding-left: 20px;
        }

        .stage-details li {
            margin: 5px 0;
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
        <h1>🚀 DevOps Pipeline - Stage Progress</h1>

        <!-- Stage 1: COMPLETED -->
        <div class="stage">
            <div class="stage-header">
                <div class="stage-number">1</div>
                <div class="stage-title">Maven Build & Tomcat Deployment</div>
                <span class="status-badge">✓ COMPLETED</span>
            </div>
            <div class="stage-details">
                <p><strong>What we accomplished:</strong></p>
                <ul>
                    <li><strong>Infrastructure Setup:</strong> Configured 4 Ubuntu EC2 instances (Jenkins, Tomcat,
                        Ansible, Docker)</li>
                    <li><strong>Jenkins Configuration:</strong> Installed plugins (Maven, Git, Deploy to Container),
                        configured JDK and Maven tools</li>
                    <li><strong>Source Code Management:</strong> Connected Jenkins to GitHub repository</li>
                    <li><strong>Maven Build:</strong> Successfully compiled Java code and created WAR file
                        (hello-world.war)</li>
                    <li><strong>Tomcat Deployment:</strong> Automatically deployed WAR to Tomcat server at port 8080
                    </li>
                    <li><strong>SSH Integration:</strong> Established passwordless authentication between Ansible and
                        all target nodes</li>
                </ul>
                <p><strong>Result:</strong> Application is live at
                    <code>http://&lt;Tomcat-IP&gt;:8080/hello-world/</code>
                </p>
            </div>
        </div>

        <!-- Stage 2: COMPLETED -->
        <div class="stage">
            <div class="stage-header">
                <div class="stage-number">2</div>
                <div class="stage-title">Docker Containerization</div>
                <span class="status-badge">✓ COMPLETED</span>
            </div>
            <div class="stage-details">
                <p><strong>What we accomplished:</strong></p>
                <ul>
                    <li><strong>Dockerfile Creation:</strong> Created multi-stage Dockerfile for optimized building and
                        deployment</li>
                    <li><strong>Jenkins Integration:</strong> Added Docker build, tag, and push steps to the CI/CD
                        pipeline</li>
                    <li><strong>Docker Hub:</strong> Successfully pushed versioned and 'latest' images to Docker Hub
                    </li>
                    <li><strong>Manual Deployment:</strong> Verified container execution on the Docker Host server</li>
                    <li><strong>Tomcat optimization:</strong> Fixed deployment conflicts by cleaning the webapps
                        directory in the Docker image</li>
                </ul>
            </div>
        </div>

        <!-- Stage 3: PENDING -->
        <div class="stage pending">
            <div class="stage-header">
                <div class="stage-number">3</div>
                <div class="stage-title">Ansible Automation</div>
                <span class="status-badge pending">PENDING</span>
            </div>
            <div class="stage-details">
                <p><strong>Next steps:</strong></p>
                <ul>
                    <li>Create Ansible playbook for Docker deployment</li>
                    <li>Automate container lifecycle management</li>
                    <li>Deploy application using Ansible from Jenkins</li>
                </ul>
            </div>
        </div>

        <!-- Stage 4: PENDING -->
        <div class="stage pending">
            <div class="stage-header">
                <div class="stage-number">4</div>
                <div class="stage-title">Kubernetes Orchestration</div>
                <span class="status-badge pending">PENDING</span>
            </div>
            <div class="stage-details">
                <p><strong>Next steps:</strong></p>
                <ul>
                    <li>Setup AWS EKS cluster</li>
                    <li>Create Kubernetes deployment and service manifests</li>
                    <li>Deploy containerized app to Kubernetes</li>
                </ul>
            </div>
        </div>

        <div class="footer">
            <p><strong>Project:</strong> Complete CI/CD Pipeline Implementation</p>
            <p><strong>Build Time:</strong>
                <%= new java.util.Date() %>
            </p>
        </div>
    </div>
</body>

</html>