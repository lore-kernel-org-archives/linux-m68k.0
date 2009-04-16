From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Network died completely in 2.6.29 - also on m68k :)
Date: Thu, 16 Apr 2009 10:19:31 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org


After getting my ebuilds going, I compiled and installed 2.6.29 first o=
n
aranym, where it works just fine, and then on one of my A1200s. On the
A1200 it seemed to work fine, for a while that is, suddenly the network
stopped up - completely. Nothing in dmesg, but rmmod/modprobe apne does
not make any difference, and I cant even ping 127.0.0.1 - so I guess th=
is
is the infamous 2.6.29 bug that was fixed in 2.6.29.1, and that is
described here http://lkml.org/lkml/2009/3/27/421

So, I tryed to pull out a m68k-v2.6.29.1 from git, but appearantly ther=
e is no
such thing. So=C2=B8 it is probably to add the "Disable GRO on legacy n=
etif_rx
path" patch (in posting above) to the v2.6.29 branch, no?

I will put it in locally now and see if it works for me.

-- kolla
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
