From: Stephen R Marenka <stephen@marenka.net>
Subject: Re: bogl: don't know screen type 1
Date: Mon, 31 Aug 2009 07:06:17 -0500
Message-ID: <20090831120617.GA1114@marenka.net>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.knology.net ([24.214.63.101]:58834 "EHLO smtp.knology.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751041AbZHaMM6 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 31 Aug 2009 08:12:58 -0400
Content-Disposition: inline
In-Reply-To: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Mon, Aug 31, 2009 at 05:28:50AM +0200, mike wrote:
> Hi,
> 
> Decided to reinstall linux, but this error haunts me.
> Adding nolangchooser didnt help.
> 
> My boot file looks like this
> amiboot -d -m mfile -k vmlinuz-2.4.27-amiga -r initrd.gz root=/dev/ram
> video=amifb:pal-lace
> 
> Tried pretty much everything, it seems to die around the kbd chooser,
> so i added bootkbd=querty/us.
> This resulted in a segmentation fault before the bogl'ing started. By
> the life of my i cant remember what i did last time.... But im pretty
> sure i didnt add nolangchooser.

I believe you want to add the parameter fb=false to your kernel 
parameters. bogl is a graphics library that assumes kernel support 
that amiga doesn't have. fb=false tells d-i to not go there.

2.4.27 hasn't been tested with d-i in quite some time, at least not by me.

Peace,

Stephen

-- 
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>
