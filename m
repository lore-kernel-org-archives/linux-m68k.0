From: Thorsten Glaser <tg@debian.org>
Subject: /proc/diskstats all-zero on NatFeat HDD
Date: Sun, 1 Sep 2013 16:26:55 +0000 (UTC)
Message-ID: <loom.20130901T182605-142@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:58616 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753409Ab3IAQ1O (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 1 Sep 2013 12:27:14 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1VGAUa-0008LV-Nx
	for linux-m68k@vger.kernel.org; Sun, 01 Sep 2013 18:27:12 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 01 Sep 2013 18:27:12 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 01 Sep 2013 18:27:12 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

root@ara4:~ # cat /proc/diskstats ; uname -
a                                                                   =20
 254     128 nfhd8 0 0 0 0 0 0 0 0 0 0 0
 254     129 nfhd8p1 0 0 0 0 0 0 0 0 0 0 0
 254     130 nfhd8p2 0 0 0 0 0 0 0 0 0 0 0
Linux ara4.mirbsd.org 3.10-2-m68k #1 Debian 3.10.7-1 (2013-08-17) m68k =
GNU/
Linux


We found this during procps debugging. JFYI.
(I don=E2=80=99t particularily care about the stats myself=E2=80=A6)

bye,
//mirabilos
