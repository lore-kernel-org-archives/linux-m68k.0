From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v5 15/26] powerpc: Implement arch_nvram_ops.get_size() and remove old nvram_* exports
Date: Sat, 25 Jul 2015 17:46:14 +1000
Message-ID: <20150725074603.183300268@telegraphics.com.au>
References: <20150725074559.543547894@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline; filename=ppc32-introduce-nvram_ops-get_size
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

Implement arch_nvram_ops for PPC32 and make use of it in the generic_nvram
misc device module so that the nvram_* function exports can be removed.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 arch/powerpc/include/asm/nvram.h |    3 ---
 arch/powerpc/kernel/setup_32.c   |   10 +++++++---
 drivers/char/generic_nvram.c     |   24 ++++++++++++------------
 3 files changed, 19 insertions(+), 18 deletions(-)

Index: linux/arch/powerpc/include/asm/nvram.h
===================================================================
--- linux.orig/arch/powerpc/include/asm/nvram.h	2015-07-25 17:45:38.000000000 +1000
+++ linux/arch/powerpc/include/asm/nvram.h	2015-07-25 17:45:41.000000000 +1000
@@ -98,7 +98,4 @@ extern int nvram_write_os_partition(stru
 				    unsigned int err_type,
 				    unsigned int error_log_cnt);
 
-/* Determine NVRAM size */
-extern ssize_t nvram_get_size(void);
-
 #endif /* _ASM_POWERPC_NVRAM_H */
Index: linux/arch/powerpc/kernel/setup_32.c
===================================================================
--- linux.orig/arch/powerpc/kernel/setup_32.c	2015-07-25 17:45:38.000000000 +1000
+++ linux/arch/powerpc/kernel/setup_32.c	2015-07-25 17:45:41.000000000 +1000
@@ -186,13 +186,12 @@ void nvram_write_byte(unsigned char val,
 }
 EXPORT_SYMBOL(nvram_write_byte);
 
-ssize_t nvram_get_size(void)
+static ssize_t ppc_nvram_get_size(void)
 {
 	if (ppc_md.nvram_size)
 		return ppc_md.nvram_size();
-	return -1;
+	return -ENODEV;
 }
-EXPORT_SYMBOL(nvram_get_size);
 
 void nvram_sync(void)
 {
@@ -201,6 +200,11 @@ void nvram_sync(void)
 }
 EXPORT_SYMBOL(nvram_sync);
 
+const struct nvram_ops arch_nvram_ops = {
+	.get_size       = ppc_nvram_get_size,
+};
+EXPORT_SYMBOL(arch_nvram_ops);
+
 #endif /* CONFIG_NVRAM */
 
 int __init ppc_init(void)
Index: linux/drivers/char/generic_nvram.c
===================================================================
--- linux.orig/drivers/char/generic_nvram.c	2015-07-25 17:45:38.000000000 +1000
+++ linux/drivers/char/generic_nvram.c	2015-07-25 17:45:41.000000000 +1000
@@ -27,8 +27,6 @@
 #include <asm/machdep.h>
 #endif
 
-#define NVRAM_SIZE	8192
-
 static DEFINE_MUTEX(nvram_mutex);
 static ssize_t nvram_len;
 
@@ -149,20 +147,22 @@ static struct miscdevice nvram_dev = {
 
 int __init nvram_init(void)
 {
-	int ret = 0;
+	int ret;
 
-	printk(KERN_INFO "Generic non-volatile memory driver v%s\n",
-		NVRAM_VERSION);
-	ret = misc_register(&nvram_dev);
-	if (ret != 0)
-		goto out;
+	if (arch_nvram_ops.get_size == NULL)
+		return -ENODEV;
 
-	nvram_len = nvram_get_size();
+	nvram_len = arch_nvram_ops.get_size();
 	if (nvram_len < 0)
-		nvram_len = NVRAM_SIZE;
+		return nvram_len;
 
-out:
-	return ret;
+	ret = misc_register(&nvram_dev);
+	if (ret)
+		return ret;
+
+	pr_info("Generic non-volatile memory driver v%s\n", NVRAM_VERSION);
+
+	return 0;
 }
 
 void __exit nvram_cleanup(void)
