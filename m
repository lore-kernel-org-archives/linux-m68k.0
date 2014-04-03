From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Thu, 03 Apr 2014 22:46:47 +1000
Message-ID: <533D5837.803@westnet.com.au>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>	<CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com>	<CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>	<533C0208.3040206@gmail.com> <CAO64nm70mwZijE4x4-+kcxckUy78DONPRYquxUdFFzGzS47xbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.222]:22673
	"EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751879AbaDCMqu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Apr 2014 08:46:50 -0400
In-Reply-To: <CAO64nm70mwZijE4x4-+kcxckUy78DONPRYquxUdFFzGzS47xbw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>
Cc: linux-m68k@vger.kernel.org

Hi Daniel,

On 02/04/14 23:19, Daniel Palmer wrote:
> On Wed, Apr 2, 2014 at 9:26 PM, Greg Ungerer <gregungerer00@gmail.com> wrote:
>> Can you create patches and send them here?
>> Clean neat patches are easily pushed up-stream to the kernel.
>
> I'll try to do this in the next few days. I'm not sure what the
> layering of the patches should be. I know that changing too much in
> one patch is a no no.

What you want is each patch to be one logical change. Small is good,
makes them easy to review. Sometimes they may need to be large. What
you don't want is a mixture of things thrown together (multiple bug
fixes, formatting changes, new features, etc).


> Maybe the first patch would just be to make EZ and VZ chips bootable
> again by adding in the lines to setup the PLL and setting up
> mach_shed_init in platform/68000/m68[EZ|VZ]328.c?

Sure, sounds good.


> Then if Finn's changes for earlyprintk are merged it would be simple
> to add the code to support that for the Dragonball chips as another
> patch.

Regards
Greg
