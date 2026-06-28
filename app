<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AgroAdvisor – AI Farmer Advisory</title>
<style>
  /* ── RESET & TOKENS ─────────────────────────────── */
  *, *::before, *::after { margin:0; padding:0; box-sizing:border-box; }

  :root {
    --green-900: #1b5e20;
    --green-700: #2e7d32;
    --green-500: #4caf50;
    --green-200: #c8e6c9;
    --green-50:  #f1f8f1;
    --amber:     #e9a23b;
    --amber-light: #fef3dc;
    --cream:     #f8f4e9;
    --white:     #ffffff;
    --gray-100:  #f5f5f5;
    --gray-300:  #d0d0d0;
    --gray-500:  #888;
    --gray-700:  #444;
    --red-light: #fdecea;
    --red:       #e53935;
    --font: 'Segoe UI', Arial, sans-serif;
    --radius: 12px;
    --shadow: 0 2px 12px rgba(0,0,0,0.08);
    --shadow-md: 0 6px 24px rgba(0,0,0,0.12);
    --sidebar-w: 230px;
    --topbar-h: 64px;
    --transition: 0.2s ease;
  }

  body { font-family: var(--font); background: var(--cream); color: var(--gray-700); }

  /* ── PAGES ──────────────────────────────────────── */
  .page { display: none; }
  .page.active { display: block; }

  /* ══════════════════════════════════════════════════
     LOGIN PAGE
  ══════════════════════════════════════════════════ */
  #loginPage {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #2e7d32, #81c784);
  }

  .login-card {
    width: 900px; max-width: 95%;
    background: var(--white);
    border-radius: 16px;
    overflow: hidden;
    display: flex;
    box-shadow: var(--shadow-md);
  }

  .login-left {
    flex: 1;
    background: url('https://images.unsplash.com/photo-1500937386664-56d1dfef3854?w=1000') center/cover;
    position: relative;
    display: flex; flex-direction: column;
    justify-content: flex-end;
    padding: 40px;
    color: white;
  }
  .login-left::before {
    content:'';
    position:absolute; inset:0;
    background: linear-gradient(to top, rgba(27,94,32,0.85) 0%, rgba(0,0,0,0.1) 60%);
  }
  .login-left-content { position: relative; z-index:1; }
  .login-left h1 { font-size: 30px; font-weight: 700; margin-bottom: 10px; }
  .login-left p  { font-size: 15px; opacity: 0.9; line-height: 1.6; }
  .login-left .tagline {
    display: inline-block;
    margin-top: 16px;
    background: rgba(255,255,255,0.18);
    border: 1px solid rgba(255,255,255,0.35);
    border-radius: 20px;
    padding: 6px 16px;
    font-size: 13px;
    backdrop-filter: blur(4px);
  }

  .login-right { flex: 1; padding: 50px 44px; }
  .login-logo { text-align:center; font-size: 48px; margin-bottom: 6px; }
  .login-right h2 { text-align:center; color: var(--green-700); font-size: 26px; margin-bottom: 6px; }
  .login-right .subtitle { text-align:center; color: var(--gray-500); font-size: 14px; margin-bottom: 32px; }

  .form-group { margin-bottom: 20px; }
  .form-group label { display:block; font-size: 13px; font-weight: 600; margin-bottom: 7px; color: var(--gray-700); }
  .form-group input {
    width:100%; padding: 12px 14px;
    border: 1.5px solid var(--gray-300);
    border-radius: 8px;
    font-size: 14px; color: var(--gray-700);
    transition: border-color var(--transition);
  }
  .form-group input:focus { outline:none; border-color: var(--green-700); }

  .form-row { display:flex; justify-content:space-between; align-items:center; margin-bottom: 22px; font-size: 13px; }
  .form-row label { display:flex; align-items:center; gap:6px; cursor:pointer; }
  .form-row a { color: var(--green-700); text-decoration:none; font-weight:600; }

  .btn-primary {
    width:100%; padding: 13px;
    background: var(--green-700); color: white;
    border:none; border-radius: 8px;
    font-size: 15px; font-weight: 600;
    cursor:pointer; transition: background var(--transition);
    letter-spacing: 0.3px;
  }
  .btn-primary:hover { background: var(--green-900); }

  .login-footer { text-align:center; margin-top: 22px; font-size: 14px; color: var(--gray-500); }
  .login-footer a { color: var(--green-700); font-weight: 700; text-decoration:none; }

  .error-msg {
    background: var(--red-light); color: var(--red);
    border: 1px solid #f5c6c6;
    border-radius: 8px; padding: 10px 14px;
    font-size: 13px; margin-bottom: 16px;
    display:none;
  }

  /* ══════════════════════════════════════════════════
     DASHBOARD SHELL
  ══════════════════════════════════════════════════ */
  #dashPage { min-height: 100vh; display:flex; flex-direction:column; }

  /* TOPBAR */
  .topbar {
    position: fixed; top:0; left:0; right:0;
    height: var(--topbar-h);
    background: var(--white);
    border-bottom: 1px solid var(--green-200);
    display: flex; align-items: center;
    padding: 0 24px;
    z-index: 100;
    gap: 16px;
  }
  .topbar-brand { display:flex; align-items:center; gap: 10px; width: var(--sidebar-w); }
  .topbar-brand .brand-icon { font-size: 26px; }
  .topbar-brand .brand-name { font-size: 18px; font-weight: 700; color: var(--green-700); }
  .topbar-brand .brand-name span { color: var(--amber); }

  .topbar-right { margin-left: auto; display:flex; align-items:center; gap: 18px; }

  .topbar-search {
    display:flex; align-items:center;
    background: var(--gray-100);
    border: 1px solid var(--gray-300);
    border-radius: 8px;
    padding: 7px 12px; gap: 8px;
  }
  .topbar-search input {
    border:none; background:transparent;
    font-size: 13px; width: 180px;
    outline:none; color: var(--gray-700);
  }
  .topbar-search .search-icon { color: var(--gray-500); font-size: 14px; }

  .notif-btn {
    position:relative; background:none; border:none;
    font-size: 20px; cursor:pointer;
    color: var(--gray-700);
  }
  .notif-badge {
    position:absolute; top:-3px; right:-4px;
    background: var(--red); color:white;
    font-size: 9px; font-weight: 700;
    width: 16px; height: 16px;
    border-radius: 50%; display:flex; align-items:center; justify-content:center;
  }

  .user-pill {
    display:flex; align-items:center; gap: 10px;
    background: var(--green-50);
    border: 1px solid var(--green-200);
    border-radius: 30px;
    padding: 5px 14px 5px 5px;
    cursor:pointer;
  }
  .user-avatar {
    width: 32px; height: 32px;
    background: var(--green-700); color:white;
    border-radius: 50%;
    display:flex; align-items:center; justify-content:center;
    font-size: 13px; font-weight: 700;
  }
  .user-pill .user-name { font-size: 13px; font-weight: 600; color: var(--green-900); }

  .logout-btn {
    background: none; border: 1.5px solid var(--gray-300);
    border-radius: 8px; padding: 7px 14px;
    font-size: 13px; cursor:pointer; color: var(--gray-500);
    transition: all var(--transition);
  }
  .logout-btn:hover { border-color: var(--red); color: var(--red); }

  /* BODY LAYOUT */
  .dash-body {
    display: flex;
    padding-top: var(--topbar-h);
    min-height: 100vh;
  }

  /* SIDEBAR */
  .sidebar {
    width: var(--sidebar-w);
    position: fixed;
    top: var(--topbar-h); bottom: 0; left: 0;
    background: var(--white);
    border-right: 1px solid var(--green-200);
    padding: 24px 0;
    overflow-y: auto;
  }

  .nav-section-label {
    font-size: 10px; font-weight: 700;
    text-transform: uppercase; letter-spacing: 1px;
    color: var(--gray-500);
    padding: 0 20px 8px;
    margin-top: 12px;
  }

  .nav-item {
    display: flex; align-items: center; gap: 12px;
    padding: 11px 20px;
    font-size: 14px; font-weight: 500;
    color: var(--gray-700);
    cursor: pointer;
    border-left: 3px solid transparent;
    transition: all var(--transition);
    border-radius: 0 8px 8px 0;
    margin: 1px 8px 1px 0;
    user-select: none;
  }
  .nav-item:hover { background: var(--green-50); color: var(--green-700); }
  .nav-item.active {
    background: var(--green-50);
    color: var(--green-700);
    border-left-color: var(--green-700);
    font-weight: 700;
  }
  .nav-item .nav-icon { font-size: 18px; width: 22px; text-align:center; }
  .nav-badge {
    margin-left:auto;
    background: var(--amber); color: white;
    font-size: 10px; font-weight: 700;
    padding: 2px 7px; border-radius: 10px;
  }

  /* MAIN CONTENT */
  .main {
    margin-left: var(--sidebar-w);
    flex: 1;
    padding: 28px;
    max-width: 100%;
  }

  /* ── SECTIONS ── */
  .section { display:none; }
  .section.active { display:block; }

  /* Page header */
  .page-header { margin-bottom: 24px; }
  .page-header h1 { font-size: 22px; font-weight: 700; color: var(--green-900); }
  .page-header p  { font-size: 14px; color: var(--gray-500); margin-top: 4px; }

  /* ── STAT CARDS ── */
  .stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 16px;
    margin-bottom: 24px;
  }
  .stat-card {
    background: var(--white);
    border-radius: var(--radius);
    padding: 20px;
    box-shadow: var(--shadow);
    border-top: 3px solid transparent;
    transition: transform var(--transition);
  }
  .stat-card:hover { transform: translateY(-2px); }
  .stat-card.green  { border-top-color: var(--green-700); }
  .stat-card.amber  { border-top-color: var(--amber); }
  .stat-card.blue   { border-top-color: #1565c0; }
  .stat-card.teal   { border-top-color: #00695c; }

  .stat-icon { font-size: 26px; margin-bottom: 10px; }
  .stat-value { font-size: 28px; font-weight: 800; color: var(--green-900); }
  .stat-label { font-size: 12px; color: var(--gray-500); margin-top: 2px; font-weight: 500; }

  /* ── TWO-COL GRID ── */
  .two-col { display:grid; grid-template-columns: 1fr 1fr; gap:16px; margin-bottom: 24px; }
  @media(max-width: 900px) { .two-col { grid-template-columns: 1fr; } }

  /* ── CARD ── */
  .card {
    background: var(--white);
    border-radius: var(--radius);
    box-shadow: var(--shadow);
    padding: 22px;
  }
  .card-title {
    font-size: 14px; font-weight: 700;
    color: var(--green-900); margin-bottom: 16px;
    display:flex; align-items:center; gap: 8px;
  }
  .card-title .ct-icon { font-size: 16px; }

  /* ── WEATHER WIDGET ── */
  .weather-big {
    background: linear-gradient(135deg, var(--green-700), var(--green-900));
    color: white; border-radius: var(--radius);
    padding: 22px; margin-bottom: 16px;
  }
  .weather-top { display:flex; justify-content:space-between; align-items:flex-start; }
  .weather-temp { font-size: 42px; font-weight: 800; }
  .weather-icon-big { font-size: 48px; }
  .weather-desc { font-size: 14px; opacity: 0.85; margin-top: 4px; }
  .weather-loc { font-size: 12px; opacity: 0.7; margin-top: 2px; }
  .weather-row {
    display:grid; grid-template-columns: repeat(3,1fr);
    gap:10px; margin-top: 16px;
    border-top: 1px solid rgba(255,255,255,0.2);
    padding-top: 14px;
  }
  .weather-stat { text-align:center; }
  .weather-stat .ws-label { font-size:10px; opacity:0.7; }
  .weather-stat .ws-val { font-size:14px; font-weight:700; }

  /* Forecast row */
  .forecast-row { display:grid; grid-template-columns: repeat(5,1fr); gap:8px; }
  .forecast-day {
    background: var(--green-50); border-radius: 8px;
    padding: 10px 6px; text-align:center;
    border: 1px solid var(--green-200);
  }
  .forecast-day .fd-name { font-size:11px; color:var(--gray-500); font-weight:600; }
  .forecast-day .fd-icon { font-size:20px; margin: 4px 0; }
  .forecast-day .fd-temp { font-size:13px; font-weight:700; color:var(--green-900); }

  /* ── QUERY BOX ── */
  .query-box { margin-bottom: 24px; }
  .query-box .card { padding: 28px; }

  .query-top { display:flex; gap:14px; margin-bottom:14px; }
  .query-top select, .query-top input[type=text] {
    flex:1; padding: 11px 14px;
    border: 1.5px solid var(--gray-300);
    border-radius: 8px; font-size: 14px;
    color: var(--gray-700);
    transition: border-color var(--transition);
  }
  .query-top select:focus, .query-top input[type=text]:focus {
    outline:none; border-color: var(--green-700);
  }

  .query-textarea {
    width:100%; min-height: 100px;
    padding: 13px 14px;
    border: 1.5px solid var(--gray-300);
    border-radius: 8px;
    font-size: 14px; font-family: var(--font);
    resize: vertical; color: var(--gray-700);
    transition: border-color var(--transition);
    margin-bottom: 14px;
  }
  .query-textarea:focus { outline:none; border-color: var(--green-700); }

  .query-actions { display:flex; align-items:center; gap:12px; }
  .btn-ask {
    padding: 11px 28px;
    background: var(--green-700); color: white;
    border:none; border-radius: 8px;
    font-size: 14px; font-weight: 700;
    cursor:pointer; transition: background var(--transition);
    display:flex; align-items:center; gap: 8px;
  }
  .btn-ask:hover { background: var(--green-900); }
  .btn-ask:disabled { background: var(--gray-300); cursor:not-allowed; }

  .btn-clear {
    padding: 11px 18px;
    background: none; border: 1.5px solid var(--gray-300);
    border-radius: 8px; font-size: 14px;
    cursor:pointer; color: var(--gray-500);
    transition: all var(--transition);
  }
  .btn-clear:hover { border-color: var(--red); color: var(--red); }

  /* AI response card */
  .ai-response {
    background: var(--green-50);
    border: 1px solid var(--green-200);
    border-radius: var(--radius);
    padding: 20px;
    margin-top: 16px;
    display:none;
    position: relative;
  }
  .ai-response.visible { display:block; }
  .ai-header {
    display:flex; align-items:center; gap: 10px;
    margin-bottom: 12px;
  }
  .ai-avatar {
    width: 34px; height: 34px;
    background: var(--green-700); color:white;
    border-radius: 50%;
    display:flex; align-items:center; justify-content:center;
    font-size: 16px; flex-shrink:0;
  }
  .ai-label { font-size: 13px; font-weight:700; color: var(--green-900); }
  .ai-sublabel { font-size: 11px; color: var(--gray-500); }
  .ai-body { font-size: 14px; line-height: 1.75; color: var(--gray-700); }
  .ai-body strong { color: var(--green-900); }
  .ai-footer { margin-top: 14px; display:flex; gap:10px; align-items:center; }
  .btn-save {
    font-size: 13px; padding: 7px 16px;
    background: var(--green-700); color:white;
    border:none; border-radius: 6px; cursor:pointer;
    transition: background var(--transition);
  }
  .btn-save:hover { background: var(--green-900); }
  .btn-copy {
    font-size: 13px; padding: 7px 16px;
    background: none; border: 1.5px solid var(--green-200);
    color: var(--green-700); border-radius: 6px; cursor:pointer;
    transition: all var(--transition);
  }
  .btn-copy:hover { background: var(--green-200); }

  /* Thinking animation */
  .thinking {
    display:flex; align-items:center; gap: 10px;
    padding: 14px; display:none;
    color: var(--gray-500); font-size: 14px;
  }
  .thinking.visible { display:flex; }
  .dot-pulse span {
    display:inline-block;
    width:8px; height:8px;
    background: var(--green-500); border-radius:50%;
    animation: pulse 1.2s infinite;
    margin-right: 3px;
  }
  .dot-pulse span:nth-child(2) { animation-delay: 0.2s; }
  .dot-pulse span:nth-child(3) { animation-delay: 0.4s; }
  @keyframes pulse {
    0%,80%,100% { transform:scale(0.6); opacity:0.4; }
    40%          { transform:scale(1);   opacity:1; }
  }

  /* ── HISTORY TABLE ── */
  .table-wrap { overflow-x:auto; }
  table { width:100%; border-collapse:collapse; font-size: 13px; }
  thead tr { background: var(--green-50); }
  th { padding: 11px 14px; text-align:left; font-weight:700; color: var(--green-900); font-size:12px; text-transform:uppercase; letter-spacing:0.5px; }
  td { padding: 11px 14px; border-bottom: 1px solid var(--gray-100); color: var(--gray-700); }
  tr:last-child td { border-bottom:none; }
  tr:hover td { background: var(--green-50); }

  .pill {
    display:inline-block; font-size:11px; font-weight:700;
    padding: 3px 10px; border-radius: 20px;
  }
  .pill.resolved { background: #e8f5e9; color: #2e7d32; }
  .pill.pending  { background: var(--amber-light); color: #b85c00; }
  .pill.critical { background: var(--red-light); color: var(--red); }

  .btn-view {
    font-size:12px; padding: 5px 12px;
    background: none; border: 1px solid var(--green-200);
    border-radius: 6px; cursor:pointer; color: var(--green-700);
    transition: all var(--transition);
  }
  .btn-view:hover { background: var(--green-700); color:white; }

  /* Table controls */
  .table-controls {
    display:flex; justify-content:space-between; align-items:center;
    margin-bottom: 14px;
  }
  .table-controls .tc-left { display:flex; gap: 10px; }
  .filter-select {
    padding: 7px 12px; border: 1.5px solid var(--gray-300);
    border-radius: 8px; font-size: 13px; color: var(--gray-700);
    cursor:pointer;
  }
  .filter-select:focus { outline:none; border-color: var(--green-700); }

  /* ── CROP HEALTH ── */
  .crop-grid { display:grid; grid-template-columns: repeat(auto-fit, minmax(220px,1fr)); gap:16px; margin-bottom: 24px; }
  .crop-card {
    background: var(--white); border-radius: var(--radius);
    box-shadow: var(--shadow); padding: 20px;
    transition: transform var(--transition);
  }
  .crop-card:hover { transform: translateY(-2px); }
  .crop-card-top { display:flex; justify-content:space-between; align-items:center; margin-bottom: 12px; }
  .crop-name { font-size: 15px; font-weight: 700; color: var(--green-900); }
  .crop-emoji { font-size: 28px; }
  .health-bar-wrap { margin-bottom: 8px; }
  .health-bar-label { display:flex; justify-content:space-between; font-size:12px; color:var(--gray-500); margin-bottom:5px; }
  .health-bar { height: 8px; background: var(--gray-100); border-radius: 4px; overflow:hidden; }
  .health-bar-fill { height:100%; border-radius:4px; transition: width 0.8s ease; }
  .health-bar-fill.excellent { background: var(--green-700); }
  .health-bar-fill.good      { background: var(--green-500); }
  .health-bar-fill.fair      { background: var(--amber); }
  .health-bar-fill.poor      { background: var(--red); }
  .crop-meta { font-size:12px; color:var(--gray-500); margin-top:8px; }

  /* ── SETTINGS ── */
  .settings-grid { display:grid; grid-template-columns: 1fr 1fr; gap:16px; }
  @media(max-width:700px){ .settings-grid{grid-template-columns:1fr;} }
  .setting-row {
    display:flex; justify-content:space-between; align-items:center;
    padding: 14px 0; border-bottom: 1px solid var(--gray-100);
    font-size: 14px;
  }
  .setting-row:last-child { border-bottom:none; }
  .setting-label { font-weight:600; color:var(--green-900); }
  .setting-sub { font-size:12px; color:var(--gray-500); margin-top:2px; }
  .toggle {
    width:40px; height:22px; background:var(--gray-300);
    border-radius:11px; position:relative; cursor:pointer;
    transition: background var(--transition); border:none;
    flex-shrink:0;
  }
  .toggle.on { background: var(--green-700); }
  .toggle::after {
    content:''; position:absolute;
    top:3px; left:3px; width:16px; height:16px;
    background:white; border-radius:50%;
    transition: transform var(--transition);
  }
  .toggle.on::after { transform: translateX(18px); }

  /* Profile avatar big */
  .profile-avatar-big {
    width:80px; height:80px; border-radius:50%;
    background: var(--green-700); color:white;
    font-size:28px; font-weight:700;
    display:flex; align-items:center; justify-content:center;
    margin-bottom: 12px;
  }

  /* ── TOAST ── */
  .toast {
    position:fixed; bottom:28px; right:28px;
    background: var(--green-700); color:white;
    padding: 12px 22px; border-radius: 8px;
    font-size: 14px; font-weight:600;
    box-shadow: var(--shadow-md);
    transform: translateY(80px);
    opacity:0;
    transition: all 0.3s ease;
    z-index: 999;
  }
  .toast.show { transform: translateY(0); opacity:1; }

  /* ── RESPONSIVE ── */
  @media(max-width:768px){
    .login-left { display:none; }
    .sidebar { display:none; }
    .main { margin-left:0; padding:16px; }
    .topbar-brand { width: auto; }
    .topbar-search { display:none; }
    .stats-grid { grid-template-columns: 1fr 1fr; }
    .query-top { flex-direction:column; }
    .two-col { grid-template-columns:1fr; }
    .forecast-row { grid-template-columns: repeat(3,1fr); }
  }
</style>
</head>
<body>

<!-- ═══════════════ LOGIN PAGE ═══════════════ -->
<div id="loginPage" class="page active">
  <div class="login-card">
    <div class="login-left">
      <div class="login-left-content">
        <h1>🌱 AgroAdvisor</h1>
        <p>Empowering farmers with AI-based agricultural guidance, real-time crop health monitoring & expert advisory support.</p>
        <span class="tagline">🤖 Powered by Artificial Intelligence</span>
      </div>
    </div>
    <div class="login-right">
      <div class="login-logo">🌾</div>
      <h2>Welcome Back</h2>
      <p class="subtitle">Sign in to your farmer dashboard</p>
      <div class="error-msg" id="loginError">⚠️ Incorrect email or password. Try demo@farm.com / 1234</div>
      <div class="form-group">
        <label>Email Address</label>
        <input type="email" id="loginEmail" placeholder="Enter your email" value="demo@farm.com">
      </div>
      <div class="form-group">
        <label>Password</label>
        <input type="password" id="loginPass" placeholder="Enter your password" value="1234">
      </div>
      <div class="form-row">
        <label><input type="checkbox" checked> Remember Me</label>
        <a href="#">Forgot Password?</a>
      </div>
      <button class="btn-primary" onclick="doLogin()">Login →</button>
      <div class="login-footer">New user? <a href="#" onclick="showToast('Registration coming soon!')">Register Here</a></div>
    </div>
  </div>
</div>

<!-- ═══════════════ DASHBOARD ═══════════════ -->
<div id="dashPage" class="page">

  <!-- TOPBAR -->
  <div class="topbar">
    <div class="topbar-brand">
      <span class="brand-icon">🌾</span>
      <span class="brand-name">Agro<span>Advisor</span></span>
    </div>
    <div class="topbar-search">
      <span class="search-icon">🔍</span>
      <input type="text" placeholder="Search crops, queries…">
    </div>
    <div class="topbar-right">
      <button class="notif-btn" onclick="showToast('3 new advisory alerts')">
        🔔 <span class="notif-badge">3</span>
      </button>
      <div class="user-pill">
        <div class="user-avatar" id="topAvatar">RK</div>
        <span class="user-name" id="topName">Ramesh Kumar</span>
      </div>
      <button class="logout-btn" onclick="doLogout()">Logout</button>
    </div>
  </div>

  <div class="dash-body">
    <!-- SIDEBAR -->
    <nav class="sidebar">
      <div class="nav-section-label">Main</div>
      <div class="nav-item active" onclick="switchSection('home',this)">
        <span class="nav-icon">🏠</span> Dashboard
      </div>
      <div class="nav-item" onclick="switchSection('ask',this)">
        <span class="nav-icon">🤖</span> Ask AI
        <span class="nav-badge">New</span>
      </div>
      <div class="nav-item" onclick="switchSection('history',this)">
        <span class="nav-icon">📋</span> My Queries
      </div>

      <div class="nav-section-label">Farm</div>
      <div class="nav-item" onclick="switchSection('crops',this)">
        <span class="nav-icon">🌿</span> Crop Health
      </div>
      <div class="nav-item" onclick="switchSection('weather',this)">
        <span class="nav-icon">🌤️</span> Weather
      </div>

      <div class="nav-section-label">Account</div>
      <div class="nav-item" onclick="switchSection('settings',this)">
        <span class="nav-icon">⚙️</span> Settings
      </div>
    </nav>

    <!-- MAIN -->
    <main class="main">

      <!-- ── HOME ── -->
      <div class="section active" id="sec-home">
        <div class="page-header">
          <h1>Good morning, Ramesh 👋</h1>
          <p>Here's what's happening on your farm today — Sunday, June 28, 2026</p>
        </div>

        <div class="stats-grid">
          <div class="stat-card green">
            <div class="stat-icon">📩</div>
            <div class="stat-value">28</div>
            <div class="stat-label">Total Queries</div>
          </div>
          <div class="stat-card amber">
            <div class="stat-icon">✅</div>
            <div class="stat-value">23</div>
            <div class="stat-label">Resolved</div>
          </div>
          <div class="stat-card blue">
            <div class="stat-icon">⏳</div>
            <div class="stat-value">5</div>
            <div class="stat-label">Pending</div>
          </div>
          <div class="stat-card teal">
            <div class="stat-icon">🌡️</div>
            <div class="stat-value">87%</div>
            <div class="stat-label">Crop Health Score</div>
          </div>
        </div>

        <div class="two-col">
          <!-- Quick Ask -->
          <div class="card">
            <div class="card-title"><span class="ct-icon">🤖</span> Quick AI Query</div>
            <textarea class="query-textarea" id="homeQuery" placeholder="Ask anything about your crops… e.g. My wheat leaves are turning yellow, what do I do?" style="min-height:80px;"></textarea>
            <button class="btn-ask" onclick="quickAsk()">⚡ Get Advice</button>
            <div class="thinking" id="homeThinking">
              <div class="dot-pulse"><span></span><span></span><span></span></div>
              AI is analysing your query…
            </div>
            <div class="ai-response" id="homeResponse">
              <div class="ai-header">
                <div class="ai-avatar">🌱</div>
                <div><div class="ai-label">AgroAdvisor AI</div><div class="ai-sublabel">Just now</div></div>
              </div>
              <div class="ai-body" id="homeResponseText"></div>
              <div class="ai-footer">
                <button class="btn-save" onclick="showToast('Query saved to history!')">💾 Save</button>
                <button class="btn-copy" onclick="copyResponse('homeResponseText')">📋 Copy</button>
              </div>
            </div>
          </div>

          <!-- Weather snapshot -->
          <div class="card">
            <div class="card-title"><span class="ct-icon">🌤️</span> Today's Weather</div>
            <div class="weather-big">
              <div class="weather-top">
                <div>
                  <div class="weather-temp">29°C</div>
                  <div class="weather-desc">Partly Cloudy</div>
                  <div class="weather-loc">📍 Pune, Maharashtra</div>
                </div>
                <div class="weather-icon-big">⛅</div>
              </div>
              <div class="weather-row">
                <div class="weather-stat"><div class="ws-label">Humidity</div><div class="ws-val">68%</div></div>
                <div class="weather-stat"><div class="ws-label">Wind</div><div class="ws-val">14 km/h</div></div>
                <div class="weather-stat"><div class="ws-label">Rain</div><div class="ws-val">20%</div></div>
              </div>
            </div>
            <div style="font-size:12px;color:var(--amber);font-weight:600;margin-bottom:8px;">💡 Advisory: Good day for pesticide application. Low wind & no rain expected.</div>
          </div>
        </div>

        <!-- Recent queries mini table -->
        <div class="card">
          <div class="card-title"><span class="ct-icon">📋</span> Recent Queries</div>
          <div class="table-wrap">
            <table>
              <thead><tr><th>#</th><th>Crop</th><th>Question</th><th>Date</th><th>Status</th><th>Action</th></tr></thead>
              <tbody>
                <tr><td>1</td><td>🌾 Wheat</td><td>Leaves turning yellow after rain</td><td>27 Jun 2026</td><td><span class="pill resolved">Resolved</span></td><td><button class="btn-view" onclick="switchSection('history',document.querySelectorAll('.nav-item')[2])">View</button></td></tr>
                <tr><td>2</td><td>🍅 Tomato</td><td>White spots on fruit surface</td><td>25 Jun 2026</td><td><span class="pill pending">Pending</span></td><td><button class="btn-view">View</button></td></tr>
                <tr><td>3</td><td>🌽 Maize</td><td>Stem borer infestation control</td><td>22 Jun 2026</td><td><span class="pill resolved">Resolved</span></td><td><button class="btn-view">View</button></td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- ── ASK AI ── -->
      <div class="section" id="sec-ask">
        <div class="page-header">
          <h1>🤖 Ask AI Advisor</h1>
          <p>Describe your crop problem and get instant AI-powered advisory</p>
        </div>

        <div class="card query-box">
          <div class="query-top">
            <select id="cropType">
              <option value="">🌿 Select Crop Type</option>
              <option>🌾 Wheat</option>
              <option>🍅 Tomato</option>
              <option>🌽 Maize</option>
              <option>🍚 Rice</option>
              <option>🧅 Onion</option>
              <option>🥔 Potato</option>
              <option>🌻 Sunflower</option>
              <option>Other</option>
            </select>
            <select id="queryCategory">
              <option value="">📂 Problem Category</option>
              <option>Pest & Disease</option>
              <option>Soil & Nutrition</option>
              <option>Irrigation</option>
              <option>Weather Impact</option>
              <option>Fertilizer Advice</option>
              <option>Harvesting</option>
            </select>
          </div>
          <textarea class="query-textarea" id="mainQuery" placeholder="Describe your crop problem in detail… e.g. My tomato plant leaves are curling and turning brown at the edges after the recent rain. What fertilizer or treatment should I apply?"></textarea>
          <div class="query-actions">
            <button class="btn-ask" id="askBtn" onclick="askAI()">🤖 Get AI Advice</button>
            <button class="btn-clear" onclick="clearQuery()">✕ Clear</button>
          </div>
          <div class="thinking" id="mainThinking">
            <div class="dot-pulse"><span></span><span></span><span></span></div>
            AI is analysing your crop query…
          </div>
          <div class="ai-response" id="mainResponse">
            <div class="ai-header">
              <div class="ai-avatar">🌱</div>
              <div>
                <div class="ai-label">AgroAdvisor AI Response</div>
                <div class="ai-sublabel" id="responseTime">Just now</div>
              </div>
            </div>
            <div class="ai-body" id="mainResponseText"></div>
            <div class="ai-footer">
              <button class="btn-save" onclick="showToast('✅ Advisory saved to My Queries!')">💾 Save to History</button>
              <button class="btn-copy" onclick="copyResponse('mainResponseText')">📋 Copy</button>
            </div>
          </div>
        </div>

        <!-- Tips -->
        <div class="two-col">
          <div class="card">
            <div class="card-title"><span class="ct-icon">💡</span> Tips for Better Advice</div>
            <div style="font-size:13px;line-height:2;color:var(--gray-700);">
              ✅ Mention the crop name clearly<br>
              ✅ Describe symptoms in detail<br>
              ✅ Include weather or soil conditions<br>
              ✅ Specify crop growth stage<br>
              ✅ Mention any treatments already tried
            </div>
          </div>
          <div class="card">
            <div class="card-title"><span class="ct-icon">🔥</span> Common Questions</div>
            <div style="display:flex;flex-direction:column;gap:8px;">
              <button class="btn-view" style="text-align:left;padding:10px 14px;width:100%;border-radius:8px;font-size:13px;" onclick="fillQuery('What fertilizer should I use for wheat at tillering stage?')">🌾 Best fertilizer for wheat tillering stage</button>
              <button class="btn-view" style="text-align:left;padding:10px 14px;width:100%;border-radius:8px;font-size:13px;" onclick="fillQuery('How to control aphids on tomato plants naturally?')">🍅 Natural aphid control on tomatoes</button>
              <button class="btn-view" style="text-align:left;padding:10px 14px;width:100%;border-radius:8px;font-size:13px;" onclick="fillQuery('When is the best time to irrigate rice crops?')">🍚 Best irrigation timing for rice</button>
              <button class="btn-view" style="text-align:left;padding:10px 14px;width:100%;border-radius:8px;font-size:13px;" onclick="fillQuery('How to improve soil pH for better crop yield?')">🌱 Improving soil pH for better yield</button>
            </div>
          </div>
        </div>
      </div>

      <!-- ── HISTORY ── -->
      <div class="section" id="sec-history">
        <div class="page-header">
          <h1>📋 My Queries</h1>
          <p>Complete history of all your AI advisory queries</p>
        </div>
        <div class="card">
          <div class="table-controls">
            <div class="tc-left">
              <select class="filter-select">
                <option>All Status</option>
                <option>Resolved</option>
                <option>Pending</option>
              </select>
              <select class="filter-select">
                <option>All Crops</option>
                <option>Wheat</option>
                <option>Tomato</option>
                <option>Maize</option>
                <option>Rice</option>
              </select>
            </div>
            <button class="btn-ask" style="padding:9px 18px;font-size:13px;" onclick="switchSection('ask',document.querySelectorAll('.nav-item')[1])">+ New Query</button>
          </div>
          <div class="table-wrap">
            <table>
              <thead><tr><th>#</th><th>Crop</th><th>Question</th><th>Category</th><th>Date</th><th>Status</th><th>Action</th></tr></thead>
              <tbody>
                <tr><td>1</td><td>🌾 Wheat</td><td>Leaves turning yellow after rain</td><td>Nutrition</td><td>27 Jun 2026</td><td><span class="pill resolved">Resolved</span></td><td><button class="btn-view" onclick="showToast('Opening query #1…')">View</button></td></tr>
                <tr><td>2</td><td>🍅 Tomato</td><td>White spots on fruit surface</td><td>Pest & Disease</td><td>25 Jun 2026</td><td><span class="pill pending">Pending</span></td><td><button class="btn-view">View</button></td></tr>
                <tr><td>3</td><td>🌽 Maize</td><td>Stem borer infestation control</td><td>Pest & Disease</td><td>22 Jun 2026</td><td><span class="pill resolved">Resolved</span></td><td><button class="btn-view">View</button></td></tr>
                <tr><td>4</td><td>🍚 Rice</td><td>Irrigation schedule for monsoon season</td><td>Irrigation</td><td>18 Jun 2026</td><td><span class="pill resolved">Resolved</span></td><td><button class="btn-view">View</button></td></tr>
                <tr><td>5</td><td>🧅 Onion</td><td>Bulb not forming properly after 60 days</td><td>Soil & Nutrition</td><td>14 Jun 2026</td><td><span class="pill critical">Critical</span></td><td><button class="btn-view">View</button></td></tr>
                <tr><td>6</td><td>🌾 Wheat</td><td>Best time to apply urea fertilizer</td><td>Fertilizer</td><td>10 Jun 2026</td><td><span class="pill resolved">Resolved</span></td><td><button class="btn-view">View</button></td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <!-- ── CROP HEALTH ── -->
      <div class="section" id="sec-crops">
        <div class="page-header">
          <h1>🌿 Crop Health Monitor</h1>
          <p>Health scores for your active crops — connect sensors or update manually</p>
        </div>
        <div class="crop-grid">
          <div class="crop-card">
            <div class="crop-card-top"><div class="crop-name">Wheat</div><div class="crop-emoji">🌾</div></div>
            <div class="health-bar-wrap">
              <div class="health-bar-label"><span>Health Score</span><span>91%</span></div>
              <div class="health-bar"><div class="health-bar-fill excellent" style="width:91%"></div></div>
            </div>
            <div class="crop-meta">📅 Planted: Apr 15 &nbsp;|&nbsp; 🗓️ Harvest: Jul 20</div>
            <div class="crop-meta" style="margin-top:4px;color:var(--green-700);font-weight:600;">✅ Excellent condition</div>
          </div>
          <div class="crop-card">
            <div class="crop-card-top"><div class="crop-name">Tomato</div><div class="crop-emoji">🍅</div></div>
            <div class="health-bar-wrap">
              <div class="health-bar-label"><span>Health Score</span><span>72%</span></div>
              <div class="health-bar"><div class="health-bar-fill good" style="width:72%"></div></div>
            </div>
            <div class="crop-meta">📅 Planted: May 5 &nbsp;|&nbsp; 🗓️ Harvest: Aug 10</div>
            <div class="crop-meta" style="margin-top:4px;color:var(--green-500);font-weight:600;">🟡 Monitor white spots</div>
          </div>
          <div class="crop-card">
            <div class="crop-card-top"><div class="crop-name">Maize</div><div class="crop-emoji">🌽</div></div>
            <div class="health-bar-wrap">
              <div class="health-bar-label"><span>Health Score</span><span>85%</span></div>
              <div class="health-bar"><div class="health-bar-fill good" style="width:85%"></div></div>
            </div>
            <div class="crop-meta">📅 Planted: Mar 20 &nbsp;|&nbsp; 🗓️ Harvest: Jul 5</div>
            <div class="crop-meta" style="margin-top:4px;color:var(--green-700);font-weight:600;">✅ Good condition</div>
          </div>
          <div class="crop-card">
            <div class="crop-card-top"><div class="crop-name">Onion</div><div class="crop-emoji">🧅</div></div>
            <div class="health-bar-wrap">
              <div class="health-bar-label"><span>Health Score</span><span>48%</span></div>
              <div class="health-bar"><div class="health-bar-fill poor" style="width:48%"></div></div>
            </div>
            <div class="crop-meta">📅 Planted: Apr 28 &nbsp;|&nbsp; 🗓️ Harvest: Aug 5</div>
            <div class="crop-meta" style="margin-top:4px;color:var(--red);font-weight:600;">🔴 Needs attention — low bulb formation</div>
          </div>
          <div class="crop-card">
            <div class="crop-card-top"><div class="crop-name">Rice</div><div class="crop-emoji">🍚</div></div>
            <div class="health-bar-wrap">
              <div class="health-bar-label"><span>Health Score</span><span>79%</span></div>
              <div class="health-bar"><div class="health-bar-fill good" style="width:79%"></div></div>
            </div>
            <div class="crop-meta">📅 Planted: May 18 &nbsp;|&nbsp; 🗓️ Harvest: Sep 10</div>
            <div class="crop-meta" style="margin-top:4px;color:var(--green-500);font-weight:600;">🟢 Growing well</div>
          </div>
          <div class="crop-card" style="border:2px dashed var(--gray-300);background:var(--gray-100);display:flex;align-items:center;justify-content:center;cursor:pointer;" onclick="showToast('Add crop feature coming soon!')">
            <div style="text-align:center;color:var(--gray-500);">
              <div style="font-size:32px;">➕</div>
              <div style="font-size:13px;font-weight:600;margin-top:8px;">Add Crop</div>
            </div>
          </div>
        </div>

        <!-- Advisory alerts -->
        <div class="card">
          <div class="card-title"><span class="ct-icon">⚠️</span> Active Alerts</div>
          <div style="display:flex;flex-direction:column;gap:10px;">
            <div style="background:var(--red-light);border-left:4px solid var(--red);border-radius:8px;padding:12px 16px;font-size:13px;color:var(--red);">🔴 <strong>Onion</strong> — Bulb formation below threshold. Apply potassium-rich fertilizer immediately.</div>
            <div style="background:var(--amber-light);border-left:4px solid var(--amber);border-radius:8px;padding:12px 16px;font-size:13px;color:#7a4700;">🟡 <strong>Tomato</strong> — White spots detected. Possible fungal infection. Consider copper-based fungicide.</div>
            <div style="background:var(--green-50);border-left:4px solid var(--green-700);border-radius:8px;padding:12px 16px;font-size:13px;color:var(--green-900);">✅ <strong>Wheat</strong> — Excellent health. Continue current irrigation schedule.</div>
          </div>
        </div>
      </div>

      <!-- ── WEATHER ── -->
      <div class="section" id="sec-weather">
        <div class="page-header">
          <h1>🌤️ Weather & Farm Advisory</h1>
          <p>Real-time weather data and AI-generated farming recommendations</p>
        </div>
        <div class="two-col">
          <div>
            <div class="card" style="margin-bottom:16px;">
              <div class="card-title"><span class="ct-icon">📍</span> Current Location</div>
              <div class="weather-big">
                <div class="weather-top">
                  <div>
                    <div class="weather-temp">29°C</div>
                    <div class="weather-desc">Partly Cloudy</div>
                    <div class="weather-loc">Pune, Maharashtra, India</div>
                  </div>
                  <div class="weather-icon-big">⛅</div>
                </div>
                <div class="weather-row">
                  <div class="weather-stat"><div class="ws-label">Humidity</div><div class="ws-val">68%</div></div>
                  <div class="weather-stat"><div class="ws-label">Wind</div><div class="ws-val">14 km/h</div></div>
                  <div class="weather-stat"><div class="ws-label">UV Index</div><div class="ws-val">6 (High)</div></div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-title"><span class="ct-icon">📅</span> 5-Day Forecast</div>
              <div class="forecast-row">
                <div class="forecast-day"><div class="fd-name">Mon</div><div class="fd-icon">☀️</div><div class="fd-temp">32°C</div></div>
                <div class="forecast-day"><div class="fd-name">Tue</div><div class="fd-icon">⛅</div><div class="fd-temp">29°C</div></div>
                <div class="forecast-day"><div class="fd-name">Wed</div><div class="fd-icon">🌧️</div><div class="fd-temp">24°C</div></div>
                <div class="forecast-day"><div class="fd-name">Thu</div><div class="fd-icon">🌦️</div><div class="fd-temp">26°C</div></div>
                <div class="forecast-day"><div class="fd-name">Fri</div><div class="fd-icon">☀️</div><div class="fd-temp">31°C</div></div>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-title"><span class="ct-icon">🌾</span> AI Weather Advisories</div>
            <div style="display:flex;flex-direction:column;gap:12px;">
              <div style="background:var(--green-50);border-radius:8px;padding:14px;border:1px solid var(--green-200);">
                <div style="font-size:12px;font-weight:700;color:var(--green-700);margin-bottom:6px;">☀️ TODAY — Clear Morning</div>
                <div style="font-size:13px;line-height:1.7;">Ideal for pesticide/fertilizer application. Low wind speed and no rain expected until evening. Best time: 6–9 AM.</div>
              </div>
              <div style="background:var(--amber-light);border-radius:8px;padding:14px;border:1px solid #f5d08b;">
                <div style="font-size:12px;font-weight:700;color:#7a4700;margin-bottom:6px;">🌧️ WEDNESDAY — Rain Alert</div>
                <div style="font-size:13px;line-height:1.7;">Heavy rain forecast. Complete all harvesting activities by Tuesday evening. Ensure proper drainage in rice & onion fields.</div>
              </div>
              <div style="background:var(--red-light);border-radius:8px;padding:14px;border:1px solid #f5c6c6;">
                <div style="font-size:12px;font-weight:700;color:var(--red);margin-bottom:6px;">⚡ HIGH UV — Mon & Fri</div>
                <div style="font-size:13px;line-height:1.7;">UV index above 8. Avoid field work between 11 AM – 3 PM. Irrigation recommended in early morning to reduce heat stress.</div>
              </div>
              <div style="background:var(--green-50);border-radius:8px;padding:14px;border:1px solid var(--green-200);">
                <div style="font-size:12px;font-weight:700;color:var(--green-700);margin-bottom:6px;">💧 SOIL MOISTURE</div>
                <div style="font-size:13px;line-height:1.7;">Current soil moisture at 62%. Skip irrigation today. Resume Thursday after rain drains.</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- ── SETTINGS ── -->
      <div class="section" id="sec-settings">
        <div class="page-header">
          <h1>⚙️ Settings</h1>
          <p>Manage your account, notifications, and preferences</p>
        </div>
        <div class="settings-grid">
          <!-- Profile -->
          <div class="card">
            <div class="card-title"><span class="ct-icon">👤</span> Profile</div>
            <div style="display:flex;flex-direction:column;align-items:center;margin-bottom:20px;">
              <div class="profile-avatar-big">RK</div>
              <div style="font-size:16px;font-weight:700;color:var(--green-900);">Ramesh Kumar</div>
              <div style="font-size:13px;color:var(--gray-500);">demo@farm.com</div>
            </div>
            <div class="form-group"><label>Full Name</label><input type="text" value="Ramesh Kumar"></div>
            <div class="form-group"><label>Phone</label><input type="text" value="+91 98765 43210"></div>
            <div class="form-group"><label>Location</label><input type="text" value="Pune, Maharashtra"></div>
            <button class="btn-primary" onclick="showToast('✅ Profile updated!')">Save Changes</button>
          </div>

          <!-- Farm Details -->
          <div class="card">
            <div class="card-title"><span class="ct-icon">🌾</span> Farm Details</div>
            <div class="form-group"><label>Farm Name</label><input type="text" value="Kumar Agro Farm"></div>
            <div class="form-group"><label>Farm Size (acres)</label><input type="number" value="12"></div>
            <div class="form-group"><label>Primary Crops</label><input type="text" value="Wheat, Tomato, Maize"></div>
            <div class="form-group"><label>Soil Type</label><input type="text" value="Black Cotton Soil"></div>
            <button class="btn-primary" onclick="showToast('✅ Farm details saved!')">Save Changes</button>
          </div>

          <!-- Notifications -->
          <div class="card">
            <div class="card-title"><span class="ct-icon">🔔</span> Notifications</div>
            <div class="setting-row">
              <div><div class="setting-label">Weather Alerts</div><div class="setting-sub">Get notified about extreme weather</div></div>
              <button class="toggle on" onclick="this.classList.toggle('on')"></button>
            </div>
            <div class="setting-row">
              <div><div class="setting-label">Pest Warnings</div><div class="setting-sub">AI-detected pest outbreak alerts</div></div>
              <button class="toggle on" onclick="this.classList.toggle('on')"></button>
            </div>
            <div class="setting-row">
              <div><div class="setting-label">Query Replies</div><div class="setting-sub">When AI responds to your query</div></div>
              <button class="toggle on" onclick="this.classList.toggle('on')"></button>
            </div>
            <div class="setting-row">
              <div><div class="setting-label">Weekly Reports</div><div class="setting-sub">Summary of farm health weekly</div></div>
              <button class="toggle" onclick="this.classList.toggle('on')"></button>
            </div>
          </div>

          <!-- Preferences -->
          <div class="card">
            <div class="card-title"><span class="ct-icon">🎨</span> Preferences</div>
            <div class="setting-row">
              <div><div class="setting-label">Language</div><div class="setting-sub">App display language</div></div>
              <select class="filter-select"><option>English</option><option>Hindi</option><option>Marathi</option></select>
            </div>
            <div class="setting-row">
              <div><div class="setting-label">Units</div><div class="setting-sub">Temperature & measurement</div></div>
              <select class="filter-select"><option>Metric (°C)</option><option>Imperial (°F)</option></select>
            </div>
            <div class="setting-row">
              <div><div class="setting-label">AI Response Style</div><div class="setting-sub">Level of detail in AI answers</div></div>
              <select class="filter-select"><option>Detailed</option><option>Concise</option></select>
            </div>
            <div class="setting-row">
              <div><div class="setting-label">Dark Mode</div><div class="setting-sub">Coming soon</div></div>
              <button class="toggle" onclick="showToast('Dark mode coming soon!')"></button>
            </div>
          </div>
        </div>
      </div>

    </main>
  </div>
</div>

<!-- TOAST -->
<div class="toast" id="toast"></div>

<script>
  // ── AUTH ────────────────────────────────────────
  function doLogin() {
    const e = document.getElementById('loginEmail').value.trim();
    const p = document.getElementById('loginPass').value.trim();
    const err = document.getElementById('loginError');
    if (e === 'demo@farm.com' && p === '1234') {
      err.style.display = 'none';
      document.getElementById('loginPage').classList.remove('active');
      document.getElementById('dashPage').classList.add('active');
    } else {
      err.style.display = 'block';
    }
  }

  function doLogout() {
    document.getElementById('dashPage').classList.remove('active');
    document.getElementById('loginPage').classList.add('active');
  }

  // Enter key on login
  document.addEventListener('keydown', e => {
    if (e.key === 'Enter' && document.getElementById('loginPage').classList.contains('active')) doLogin();
  });

  // ── NAVIGATION ──────────────────────────────────
  function switchSection(id, el) {
    document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));
    document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
    document.getElementById('sec-' + id).classList.add('active');
    if (el) el.classList.add('active');
  }

  // ── AI QUERY (Claude API) ───────────────────────
  async function askAI() {
    const q = document.getElementById('mainQuery').value.trim();
    const crop = document.getElementById('cropType').value;
    const cat  = document.getElementById('queryCategory').value;
    if (!q) { showToast('⚠️ Please describe your crop problem first'); return; }

    const btn = document.getElementById('askBtn');
    btn.disabled = true;
    document.getElementById('mainThinking').classList.add('visible');
    document.getElementById('mainResponse').classList.remove('visible');

    const prompt = `You are AgroAdvisor, an expert AI agricultural advisor for Indian farmers.
A farmer asked: "${q}"
${crop ? 'Crop: ' + crop : ''}
${cat  ? 'Category: ' + cat : ''}

Give a structured, practical advisory in this format:
**🔍 Diagnosis:** (what the problem likely is)
**🌿 Cause:** (why this is happening)
**✅ Immediate Action:** (what to do right now, step by step)
**💊 Treatment/Solution:** (specific product names, dosages if applicable)
**🛡️ Prevention:** (how to avoid this in future)
**⏱️ Timeline:** (when to expect improvement)

Keep it concise, farmer-friendly, and actionable. Use simple language.`;

    try {
      const res = await fetch('https://api.anthropic.com/v1/messages', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          model: 'claude-sonnet-4-6',
          max_tokens: 1000,
          messages: [{ role: 'user', content: prompt }]
        })
      });
      const data = await res.json();
      const text = data.content?.[0]?.text || 'Unable to get response. Please try again.';
      document.getElementById('mainResponseText').innerHTML = formatResponse(text);
      document.getElementById('responseTime').textContent = new Date().toLocaleTimeString();
      document.getElementById('mainResponse').classList.add('visible');
    } catch (err) {
      document.getElementById('mainResponseText').innerHTML = '<em style="color:var(--red)">⚠️ Connection error. Please check your internet and try again.</em>';
      document.getElementById('mainResponse').classList.add('visible');
    }

    document.getElementById('mainThinking').classList.remove('visible');
    btn.disabled = false;
  }

  async function quickAsk() {
    const q = document.getElementById('homeQuery').value.trim();
    if (!q) { showToast('⚠️ Please type your question first'); return; }

    document.getElementById('homeThinking').classList.add('visible');
    document.getElementById('homeResponse').classList.remove('visible');

    const prompt = `You are AgroAdvisor, an expert AI agricultural advisor for Indian farmers.
A farmer asked: "${q}"
Give a short, practical 3-4 line advisory. Be direct and actionable. Use simple language and emojis.`;

    try {
      const res = await fetch('https://api.anthropic.com/v1/messages', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          model: 'claude-sonnet-4-6',
          max_tokens: 400,
          messages: [{ role: 'user', content: prompt }]
        })
      });
      const data = await res.json();
      const text = data.content?.[0]?.text || 'Unable to get response. Please try again.';
      document.getElementById('homeResponseText').innerHTML = formatResponse(text);
      document.getElementById('homeResponse').classList.add('visible');
    } catch {
      document.getElementById('homeResponseText').innerHTML = '<em style="color:var(--red)">⚠️ Connection error.</em>';
      document.getElementById('homeResponse').classList.add('visible');
    }
    document.getElementById('homeThinking').classList.remove('visible');
  }

  function formatResponse(text) {
    return text
      .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
      .replace(/\n\n/g, '</p><p style="margin-top:10px">')
      .replace(/\n/g, '<br>');
  }

  function clearQuery() {
    document.getElementById('mainQuery').value = '';
    document.getElementById('cropType').value = '';
    document.getElementById('queryCategory').value = '';
    document.getElementById('mainResponse').classList.remove('visible');
  }

  function fillQuery(text) {
    document.getElementById('mainQuery').value = text;
    switchSection('ask', document.querySelectorAll('.nav-item')[1]);
    document.getElementById('mainQuery').focus();
  }

  // ── UTILITY ─────────────────────────────────────
  function copyResponse(id) {
    const t = document.getElementById(id).innerText;
    navigator.clipboard.writeText(t).then(() => showToast('📋 Copied to clipboard!'));
  }

  function showToast(msg) {
    const t = document.getElementById('toast');
    t.textContent = msg;
    t.classList.add('show');
    setTimeout(() => t.classList.remove('show'), 2800);
  }
</script>
</body>
</html>
