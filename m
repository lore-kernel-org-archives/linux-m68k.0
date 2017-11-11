From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 02/14] nubus: Fix up header split
Date: Sat, 11 Nov 2017 01:12:48 -0500 (EST)
Message-ID: <ee1a7d7e0e527b072ba538601d9111825b3d827e.1510377368.git.fthain@telegraphics.com.au>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Due to the '#ifdef __KERNEL__' being located in the wrong place, some
definitions from the kernel API were placed in the UAPI header during
the scripted header split. Fix this. Also, remove the duplicate comment
which is only relevant to the UAPI header.

Fixes: 607ca46e97a1 ("UAPI: (Scripted) Disintegrate include/linux")
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 include/linux/nubus.h      | 27 +++++++++++++++++++++++----
 include/uapi/linux/nubus.h | 23 -----------------------
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index b5c4683737e3..b72340df081c 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -4,16 +4,28 @@
   Originally written by Alan Cox.
 
   Hacked to death by C. Scott Ananian and David Huggins-Daines.
-  
-  Some of the constants in here are from the corresponding
-  NetBSD/OpenBSD header file, by Allen Briggs.  We figured out the
-  rest of them on our own. */
+*/
+
 #ifndef LINUX_NUBUS_H
 #define LINUX_NUBUS_H
 
 #include <asm/nubus.h>
 #include <uapi/linux/nubus.h>
 
+struct nubus_dir {
+	unsigned char *base;
+	unsigned char *ptr;
+	int done;
+	int mask;
+};
+
+struct nubus_dirent {
+	unsigned char *base;
+	unsigned char type;
+	__u32 data;	/* Actually 24 bits used */
+	int mask;
+};
+
 struct nubus_board {
 	struct nubus_board* next;
 	struct nubus_dev* first_dev;
@@ -129,4 +141,11 @@ void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
                         unsigned int len);
 void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
                         unsigned int maxlen);
+
+/* Returns a pointer to the "standard" slot space. */
+static inline void *nubus_slot_addr(int slot)
+{
+	return (void *)(0xF0000000 | (slot << 24));
+}
+
 #endif /* LINUX_NUBUS_H */
diff --git a/include/uapi/linux/nubus.h b/include/uapi/linux/nubus.h
index ac516064f0ee..7dc64eb4dc4d 100644
--- a/include/uapi/linux/nubus.h
+++ b/include/uapi/linux/nubus.h
@@ -220,27 +220,4 @@ enum nubus_display_res_id {
 	NUBUS_RESID_SIXTHMODE   = 0x0085
 };
 
-struct nubus_dir
-{
-	unsigned char *base;
-	unsigned char *ptr;
-	int done;
-	int mask;
-};
-
-struct nubus_dirent
-{
-	unsigned char *base;
-	unsigned char type;
-	__u32 data;	/* Actually 24bits used */
-	int mask;
-};
-
-
-/* We'd like to get rid of this eventually.  Only daynaport.c uses it now. */
-static inline void *nubus_slot_addr(int slot)
-{
-	return (void *)(0xF0000000|(slot<<24));
-}
-
 #endif /* _UAPILINUX_NUBUS_H */
-- 
2.13.6
