From: Bill Pemberton <wfp5p@virginia.edu>
Subject: [PATCH 286/493] m68k: remove use of __devinit
Date: Mon, 19 Nov 2012 13:23:55 -0500
Message-ID: <1353349642-3677-286-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

CONFIG_HOTPLUG is going away as an option so __devinit is no longer
needed.

Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org> 
Cc: linux-m68k@lists.linux-m68k.org 
---
 arch/m68k/include/asm/parport.h | 4 ++--
 arch/m68k/kernel/pcibios.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/parport.h b/arch/m68k/include/asm/parport.h
index 646b187..5ea75e6 100644
--- a/arch/m68k/include/asm/parport.h
+++ b/arch/m68k/include/asm/parport.h
@@ -15,8 +15,8 @@
 #define outsl(port,buf,len)  isa_outsb(port,buf,(len)<<2)
 
 /* no dma, or IRQ autoprobing */
-static int __devinit parport_pc_find_isa_ports (int autoirq, int autodma);
-static int __devinit parport_pc_find_nonpci_ports (int autoirq, int autodma)
+static int parport_pc_find_isa_ports (int autoirq, int autodma);
+static int parport_pc_find_nonpci_ports (int autoirq, int autodma)
 {
         if (! (MACH_IS_Q40))
 	  return 0; /* count=0 */
diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
index 73fa0b5..931a31f 100644
--- a/arch/m68k/kernel/pcibios.c
+++ b/arch/m68k/kernel/pcibios.c
@@ -87,7 +87,7 @@ int pcibios_enable_device(struct pci_dev *dev, int mask)
 	return 0;
 }
 
-void __devinit pcibios_fixup_bus(struct pci_bus *bus)
+void pcibios_fixup_bus(struct pci_bus *bus)
 {
 	struct pci_dev *dev;
 
@@ -97,7 +97,7 @@ void __devinit pcibios_fixup_bus(struct pci_bus *bus)
 	}
 }
 
-char __devinit *pcibios_setup(char *str)
+char *pcibios_setup(char *str)
 {
 	return str;
 }
-- 
1.8.0
