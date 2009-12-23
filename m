From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] aranym: convert print_mac to %pM
Date: Wed, 23 Dec 2009 20:13:54 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0912232013380.23019@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Cfr. commit e174961ca1a0b28f7abf0be47973ad57cb74e5f0 ("net: convert print_mac
to %pM")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/emu/nfeth.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/emu/nfeth.c b/arch/m68k/emu/nfeth.c
index f55dfd3..8c41f6c 100644
--- a/arch/m68k/emu/nfeth.c
+++ b/arch/m68k/emu/nfeth.c
@@ -212,7 +212,6 @@ struct net_device * __init nfeth_probe(int unit)
 	struct net_device *dev;
 	struct nfeth_private *priv;
 	char mac[ETH_ALEN], host_ip[32], local_ip[32];
-	DECLARE_MAC_BUF(macfmt);
 	int err;
 
 	if (!nf_call(nfEtherID + XIF_GET_MAC, unit, mac, ETH_ALEN))
@@ -242,8 +241,8 @@ struct net_device * __init nfeth_probe(int unit)
 	nf_call(nfEtherID + XIF_GET_IPATARI, unit,
 		local_ip, sizeof(local_ip));
 
-	pr_info("%s: nfeth addr:%s (%s) HWaddr:%s\n", dev->name, host_ip,
-		local_ip, print_mac(macfmt, mac));
+	pr_info("%s: nfeth addr:%s (%s) HWaddr:%pM\n", dev->name, host_ip,
+		local_ip, mac);
 
 	return dev;
 }
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
