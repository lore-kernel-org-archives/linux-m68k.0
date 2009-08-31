From: mike <localgost@gmail.com>
Subject: bogl: don't know screen type 1
Date: Mon, 31 Aug 2009 05:28:50 +0200
Message-ID: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f217.google.com ([209.85.220.217]:37553 "EHLO
	mail-fx0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754333AbZHaD2u (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Aug 2009 23:28:50 -0400
Received: by fxm17 with SMTP id 17so2534025fxm.37
        for <linux-m68k@vger.kernel.org>; Sun, 30 Aug 2009 20:28:51 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

Decided to reinstall linux, but this error haunts me.
Adding nolangchooser didnt help.

My boot file looks like this
amiboot -d -m mfile -k vmlinuz-2.4.27-amiga -r initrd.gz root=/dev/ram
video=amifb:pal-lace

Tried pretty much everything, it seems to die around the kbd chooser,
so i added bootkbd=querty/us.
This resulted in a segmentation fault before the bogl'ing started. By
the life of my i cant remember what i did last time.... But im pretty
sure i didnt add nolangchooser.

-Mike
