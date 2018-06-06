From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] android: binder: Drop dependency on !M68K
Date: Wed,  6 Jun 2018 14:40:56 +0200
Message-ID: <1528288856-11841-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>
Cc: devel@driverdev.osuosl.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

As of commit 7124330dabe5b3cb ("m68k/uaccess: Revive 64-bit
get_user()"), the 64-bit Android binder interface builds fine on m68k.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/android/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
index ee4880bfdcdc98d2..432e9ad770703275 100644
--- a/drivers/android/Kconfig
+++ b/drivers/android/Kconfig
@@ -10,7 +10,7 @@ if ANDROID
 
 config ANDROID_BINDER_IPC
 	bool "Android Binder IPC Driver"
-	depends on MMU && !M68K
+	depends on MMU
 	default n
 	---help---
 	  Binder is used in Android for both communication between processes,
-- 
2.7.4
