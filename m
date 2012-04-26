From: Edward Shao <laface.tw@gmail.com>
Subject: Quest about m68knommu check in top of kernel Makefile.
Date: Thu, 26 Apr 2012 20:34:16 +0800
Message-ID: <CAKjXMyAvBMgPEsdiO=F1oLHt-_DBxdoz9+G=AOsejn5SLfDS_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

Hi folks,

I have a question about ($(ARCH),m68knommu) check in top of kernel Make=
file.
Any reason not to change SRCARCH but change hdr-arch?

If I modify the makefile as below, is it ok?

diff --git a/Makefile b/Makefile
index afc868e..396ed28 100644
--- a/Makefile
+++ b/Makefile
@@ -228,13 +228,14 @@ ifeq ($(ARCH),tilegx)
=A0=A0=A0=A0=A0=A0=A0 SRCARCH :=3D tile
=A0endif

-# Where to locate arch specific headers
-hdr-arch=A0 :=3D $(SRCARCH)
-
+# Additional ARCH settings for m86k
=A0ifeq ($(ARCH),m68knommu)
-=A0=A0=A0=A0=A0=A0 hdr-arch=A0 :=3D m68k
+=A0=A0=A0=A0=A0=A0 SRCARCH :=3D m68k
=A0endif

+# Where to locate arch specific headers
+hdr-arch=A0 :=3D $(SRCARCH)
+
=A0KCONFIG_CONFIG ?=3D .config
=A0export KCONFIG_CONFIG


Thank you very much.

Best Regards,
Edward
