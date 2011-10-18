From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 12/21] m68k: drop unused Kconfig symbols
Date: Tue, 18 Oct 2011 14:52:11 +1000
Message-ID: <4E9D05FB.4080607__27382.3465955958$1318914126$gmane$org@snapgear.com>
References: <1318595371.6132.70.camel@x61.thuisdomein>	 <4E9B7BE1.1080907@snapgear.com> <1318837964.6414.6.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1318837964.6414.6.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Paul,

On 17/10/11 17:52, Paul Bolle wrote:
> On Mon, 2011-10-17 at 10:50 +1000, Greg Ungerer wrote:
>> I have no problem with the changes. But it will clash with the
>> reworking of the Kconfig files currently sitting in linux-next
>> for merging in the 3.2 merge window.
>
> So should I put this on hold and see what's needed after those reworked
> Kconfig files are merged in mainline? Or would you prefer to have that
> done beforehand (ie, I'll try to redo this on top of current linux-next
> and get the redone patch in linux-next before the 3.2 merge)?

I won't be too difficult for you to redo your patch. If you can do it
on top of linux-next real soon I can push it into my m68knommu git
tree for-next branch. But it would need to be very soon :-)

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
