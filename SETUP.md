# QuickServe Web - Next.js/React Monorepo

Independent React/Next.js web apps for Vercel deployment. Separated from Flutter native code.

## 📦 Apps Included

- **web-admin** - Admin dashboard (port 3000)
- **web-consumer** - Customer ordering app (port 8080)
- **web-vendor** - Vendor management app (port 8081)
- **web-rider** - Rider/Dispatcher app (port 8082)

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ (LTS recommended)
- pnpm 8.0.0+ (`npm install -g pnpm`)

### Installation

```bash
pnpm install
```

### Development

Run all apps in parallel:
```bash
pnpm dev
```

Or run a specific app:
```bash
cd apps/web-consumer
pnpm dev
```

### Build for Production

```bash
pnpm build
```

### Deploy to Vercel

```bash
vercel deploy
```

Vercel will automatically detect the monorepo and deploy all 4 apps.

## 🔧 Environment Setup

Copy `.env.example` to `.env.local` in each app directory:

```bash
# apps/web-consumer/.env.local
NEXT_PUBLIC_API_URL=https://api.example.com
NEXT_PUBLIC_SOCKET_URL=https://api.example.com
```

### Available Environment Variables

All apps support:
- `NEXT_PUBLIC_API_URL` - Backend API base URL (required)
- `NEXT_PUBLIC_SOCKET_URL` - Socket.IO server URL (required)
- `NEXT_PUBLIC_PAYSTACK_KEY` - Paystack public key (consumer app)

## 📁 Project Structure

```
quickserve-web/
├── apps/
│   ├── web-admin/          # Admin dashboard
│   ├── web-consumer/       # Customer app
│   ├── web-vendor/         # Vendor app
│   └── web-rider/          # Rider app
├── package.json            # Root workspace
├── pnpm-workspace.yaml     # pnpm monorepo config
├── turbo.json              # Turbo build config
├── vercel.json             # Vercel deployment config
└── .env.example            # Example env variables
```

## 🔗 Backend Connection

The backend should be deployed separately to Render, Railway, or your own domain.

### Backend Deployment Options

1. **Render.com** (recommended free tier)
   - Zero cold starts on paid plans
   - GitHub auto-deploy
   - `NEXT_PUBLIC_API_URL=https://quickserve-backend.onrender.com`

2. **Railway.app**
   - $5/month free credit
   - GitHub integration
   - Postgres & Redis included

3. **Your own domain**
   - Full control
   - Requires server setup
   - `NEXT_PUBLIC_API_URL=https://api.yourdomain.com`

## 🛠 Complete App Source Code

The placeholder package.json files are in place. To populate with actual source code:

```bash
# From the original quickserve monorepo:
xcopy c:\quickserve\apps\web-admin\src c:\quickserve-web\apps\web-admin\src /E /I /Y
xcopy c:\quickserve\apps\web-consumer\src c:\quickserve-web\apps\web-consumer\src /E /I /Y
xcopy c:\quickserve\apps\web-vendor\src c:\quickserve-web\apps\web-vendor\src /E /I /Y
xcopy c:\quickserve\apps\web-rider\src c:\quickserve-web\apps\web-rider\src /E /I /Y
```

Or on macOS/Linux:
```bash
cp -r ../quickserve/apps/web-admin/src apps/web-admin/
cp -r ../quickserve/apps/web-consumer/src apps/web-consumer/
cp -r ../quickserve/apps/web-vendor/src apps/web-vendor/
cp -r ../quickserve/apps/web-rider/src apps/web-rider/
```

## 📝 API Integration Status

All apps are using centralized API services:

- `web-admin` - ✅ All pages using adminAPI service
- `web-consumer` - ✅ All pages using consumerApi service
- `web-vendor` - ✅ All pages using vendorAPI service
- `web-rider` - ✅ All pages using riderAPI service

No direct fetch() calls to backend routes.

## 🔐 Git & CI/CD

### Initialize & Push to GitHub

```bash
git init
git config user.name "Your Name"
git config user.email "your@email.com"
git remote add origin https://github.com/yourorg/quickserve-web.git
git add .
git commit -m "Initial commit: monorepo structure with app configs"
git branch -M main
git push -u origin main
```

### GitHub Actions (Optional)

Add `.github/workflows/deploy.yml` for automated Vercel deployments on push.

## 🚢 Deployment Checklist

- [ ] Backend deployed to Render/Railway/custom domain
- [ ] Update `NEXT_PUBLIC_API_URL` in `.env.local` for all apps
- [ ] Run `pnpm install` to set up dependencies
- [ ] Run `pnpm build` to verify all apps build
- [ ] Connect quickserve-web repo to Vercel
- [ ] Vercel detects monorepo and deploys all 4 projects
- [ ] Test each deployed app with real API

## 🐛 Troubleshooting

**Port conflicts when running dev mode?**
```bash
pnpm dev -- --port 3001  # Override port for web-admin
```

**Modules not found?**
```bash
pnpm install
pnpm install --force  # If lock issues persist
```

**Vercel build fails?**
- Ensure `NEXT_PUBLIC_API_URL` is set in Vercel environment variables
- Check that backend is accessible from public internet
- Review `vercel.json` build settings

## 📚 Additional Resources

- [Turbo Docs](https://turbo.build/repo/docs)
- [Next.js Docs](https://nextjs.org/docs)
- [Vercel Monorepo Deployment](https://vercel.com/docs/concepts/monorepos)
- [Render Backend Deployment](https://render.com/docs)

## 📄 License

MIT
