From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] Documentation/features/time: Mark m68k having modern-timekeeping
Date: Mon,  6 May 2019 11:00:46 +0200
Message-ID: <20190506090046.3016-1-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Jonathan Corbet <corbet@lwn.net>, Guo Ren <ren_guo@c-sky.com>, Andrea Parri <andrea.parri@amarulasolutions.com>, linux-doc@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

M68k no longer uses arch_gettimeoffset.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Enhance one-line summary.

Queueing in m68k-for-v5.2, on top of the clocksource conversion.
Sorry for missing this before.

 Documentation/features/time/modern-timekeeping/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/time/modern-timekeeping/arch-support.txt b/Documentation/features/time/modern-timekeeping/arch-support.txt
index 2855dfe2464d4a34..1d46da165b75e127 100644
--- a/Documentation/features/time/modern-timekeeping/arch-support.txt
+++ b/Documentation/features/time/modern-timekeeping/arch-support.txt
@@ -15,7 +15,7 @@
     |       h8300: |  ok  |
     |     hexagon: |  ok  |
     |        ia64: |  ok  |
-    |        m68k: | TODO |
+    |        m68k: |  ok  |
     |  microblaze: |  ok  |
     |        mips: |  ok  |
     |       nds32: |  ok  |
-- 
2.17.1
