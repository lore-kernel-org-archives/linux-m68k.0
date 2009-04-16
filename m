From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: Network died completely in 2.6.29 - also on m68k :)
Date: Thu, 16 Apr 2009 17:14:13 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.0904161710040.9966@halbrend.uninett.no>
References: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: linux-m68k@lists.linux-m68k.org

On Thu, 16 Apr 2009, Kolbj=C3=B8rn Barmen wrote:

> After getting my ebuilds going, I compiled and installed 2.6.29 first=
 on
> aranym, where it works just fine, and then on one of my A1200s. On th=
e
> A1200 it seemed to work fine, for a while that is, suddenly the netwo=
rk
> stopped up - completely. Nothing in dmesg, but rmmod/modprobe apne do=
es
> not make any difference, and I cant even ping 127.0.0.1 - so I guess =
this
> is the infamous 2.6.29 bug that was fixed in 2.6.29.1, and that is
> described here http://lkml.org/lkml/2009/3/27/421
>=20
> So, I tryed to pull out a m68k-v2.6.29.1 from git, but appearantly th=
ere is no
> such thing. So=C2=B8 it is probably to add the "Disable GRO on legacy=
 netif_rx
> path" patch (in posting above) to the v2.6.29 branch, no?
>=20
> I will put it in locally now and see if it works for me.

This seems to have done the trick yes, the patch is this one:

diff --git a/net/core/dev.c b/net/core/dev.c
index 052dd47..63ec4bf 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -2627,18 +2627,15 @@ static int process_backlog(struct napi_struct *=
napi, int quota)
 		local_irq_disable();
 		skb =3D __skb_dequeue(&queue->input_pkt_queue);
 		if (!skb) {
+			__napi_complete(napi);
 			local_irq_enable();
-			napi_complete(napi);
-			goto out;
+			break;
 		}
 		local_irq_enable();
=20
-		napi_gro_receive(napi, skb);
+		netif_receive_skb(skb);
 	} while (++work < quota && jiffies =3D=3D start_time);
=20
-	napi_gro_flush(napi);
-
-out:
 	return work;
 }

-- kolla
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
