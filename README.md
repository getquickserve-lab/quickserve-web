# QuickServe Web Apps

> React/Next.js monorepo for QuickServe delivery platform (Admin, Consumer, Vendor, Rider apps)

## 📦 Structure

```
apps/
  ├── web-admin/       # Admin dashboard
  ├── web-consumer/    # Customer app
  ├── web-vendor/      # Vendor/store dashboard
  └── web-rider/       # Rider/dispatcher app
```

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- pnpm 8.0+

### Development

```bash
pnpm install
pnpm dev
```

Apps run on:
- Admin: http://localhost:3000
- Consumer: http://localhost:3001
- Vendor: http://localhost:3002
- Rider: http://localhost:3003
- API: http://localhost:5555 (backend via NEXT_PUBLIC_API_URL)

### Build

```bash
pnpm build
pnpm start
```

## 🔧 Environment Variables

Copy `.env.example` to `.env.local`:

```bash
cp .env.example .env.local
```

**Key Variables:**
- `NEXT_PUBLIC_API_URL` — Backend API URL
  - Development: `http://localhost:5555`
  - Production (Render): `https://quickserve-backend.onrender.com`

## 📦 Deployment

### Vercel (Web Apps)

1. **Connect to Vercel:** https://vercel.com/import
2. **Select this repo:** `getquickserve-lab/quickserve-web`
3. **Configure:**
   - Build Command: `pnpm install && pnpm build`
   - Output Directory: `.next`
   - Environment: Set `NEXT_PUBLIC_API_URL` to your Render backend URL

4. **Deploy:** Click "Deploy"
5. **Preview URLs:**
   - Admin: `web-admin.quickserve.vercel.app`
   - Consumer: `web-consumer.quickserve.vercel.app`
   - Vendor: `web-vendor.quickserve.vercel.app`
   - Rider: `web-rider.quickserve.vercel.app`

### Render (Backend)

**Separate deployment** - See main quickserve repo backend setup.

**Connection URL for web apps:**
```
https://quickserve-backend.onrender.com
```

Set this in Vercel environment variables.

## 🔗 API Integration

All web apps connect to backend via `NEXT_PUBLIC_API_URL`:

```typescript
// apps/*/src/lib/api.ts
const API_BASE = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:5555';
```

### Backend Endpoints Expected

- `GET /api/vendors`
- `GET /api/products`
- `POST /api/auth/login`
- `POST /api/orders`
- etc.

See backend repo for full API docs.

## 📝 Scripts

```bash
pnpm dev              # Start dev servers (all apps)
pnpm build            # Build all apps
pnpm start            # Start production (requires build first)
pnpm lint             # Run ESLint across all apps
pnpm format           # Format all files with Prettier
pnpm type-check       # Run TypeScript checks
```

## 🛠️ Troubleshooting

**"NEXT_PUBLIC_API_URL is not set"**
- Add to `.env.local` at root level
- Vercel: Add to Project Settings > Environment Variables

**Port already in use**
- Each app assumes different port (3000-3003)
- Can be customized in package.json dev scripts

**Module not found errors**
- Run `pnpm install` again
- Clear `node_modules` and `.pnpm-store`: `rmdir /s node_modules & rmdir /s .pnpm-store`

## 📚 Related Projects

- **Backend:** https://github.com/getquickserve-lab/Quickserve (Node.js/Express)
- **Flutter Apps:** Original repo (reference for conversion logic)

## 📄 License

Proprietary - QuickServe
