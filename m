From: Daniel Palmer <danieruru@gmail.com>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Wed, 2 Apr 2014 22:19:29 +0900
Message-ID: <CAO64nm70mwZijE4x4-+kcxckUy78DONPRYquxUdFFzGzS47xbw@mail.gmail.com>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>
	<CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com>
	<CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>
	<533C0208.3040206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:45906 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758658AbaDBNTa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Apr 2014 09:19:30 -0400
Received: by mail-vc0-f174.google.com with SMTP id ld13so251176vcb.33
        for <linux-m68k@vger.kernel.org>; Wed, 02 Apr 2014 06:19:29 -0700 (PDT)
In-Reply-To: <533C0208.3040206@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer00@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Wed, Apr 2, 2014 at 9:26 PM, Greg Ungerer <gregungerer00@gmail.com> wrote:
> Can you create patches and send them here?
> Clean neat patches are easily pushed up-stream to the kernel.

I'll try to do this in the next few days. I'm not sure what the
layering of the patches should be. I know that changing too much in
one patch is a no no.

Maybe the first patch would just be to make EZ and VZ chips bootable
again by adding in the lines to setup the PLL and setting up
mach_shed_init in platform/68000/m68[EZ|VZ]328.c?
Then if Finn's changes for earlyprintk are merged it would be simple
to add the code to support that for the Dragonball chips as another
patch.
