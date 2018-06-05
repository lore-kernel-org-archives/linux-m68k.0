From: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] Fix atari label false positives
Date: Tue,  5 Jun 2018 10:30:45 -0400
Message-ID: <20180605143045.23875-1-psusi@ubuntu.com>
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
List-Unsubscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/options/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=unsubscribe>
List-Archive: <http://alioth-lists.debian.net/pipermail/parted-devel/>
List-Post: <mailto:parted-devel-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
List-Help: <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=help>
List-Subscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=subscribe>
Errors-To: parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org
Sender: "parted-devel"
 <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
To: glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
Cc: debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org
List-Id: linux-m68k@vger.kernel.org

The atari label gets false positives easily, so probe it after
all other labels have said no.
---
 NEWS                  | 2 ++
 libparted/libparted.c | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/NEWS b/NEWS
index 2c903ca5..a5ec44ee 100644
--- a/NEWS
+++ b/NEWS
@@ -6,6 +6,8 @@ GNU parted NEWS                                    -*- outline -*-
 
 ** Bug Fixes
 
+  Fix atari disklabel false positives by probing other labels first.
+
   Fix set and disk_set to not crash when there are no flags to set.
 
   Fix resizepart to adjust the end to be -1 sector when using iec
diff --git a/libparted/libparted.c b/libparted/libparted.c
index d855d0e6..e864d1b3 100644
--- a/libparted/libparted.c
+++ b/libparted/libparted.c
@@ -85,7 +85,7 @@ init_disk_types ()
 #if defined __s390__ || defined __s390x__
 	ped_disk_dasd_init();
 #endif
-
+	ped_disk_atari_init ();
 	ped_disk_sun_init ();
 #ifdef ENABLE_PC98
 	ped_disk_pc98_init ();
@@ -97,7 +97,6 @@ init_disk_types ()
 	ped_disk_bsd_init ();
 	ped_disk_amiga_init ();
 	ped_disk_aix_init ();
-	ped_disk_atari_init ();
 }
 
 extern void ped_file_system_amiga_init (void);
-- 
2.17.0
