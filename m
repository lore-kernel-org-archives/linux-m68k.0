From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: [PATCH 02/15]drivers:spi:dw_spi.c Typo change diable to disable.
Date: Fri, 31 Dec 2010 09:59:19 -0800
Message-ID: <4D1E19F7.6000608__48707.3694159791$1293818371$gmane$org@gmail.com>
References: <1293750484-1161-1-git-send-email-justinmattock@gmail.com> <1293750484-1161-2-git-send-email-justinmattock@gmail.com> <20101231064515.GC3733@angua.secretlab.ca> <4D1D7DAE.7060504@gmail.com> <20101231091136.GC1886@bicker> <4D1DE616.7010105@gmail.com> <20101231174100.GF1886@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20101231174100.GF1886@bicker>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Dan Carpenter <error27@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, trivial@kernel.org, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, netdev@vger.kernel.orglinux-

On 12/31/2010 09:41 AM, Dan Carpenter wrote:
> On Fri, Dec 31, 2010 at 06:17:58AM -0800, Justin P. Mattock wrote:
>>> Wrong:  [PATCH 02/15]drivers:spi:dw_spi.c Typo change diable to disable.
>>>
>>> Right:  [PATCH 02/15] spi/dw_spi: Typo change diable to disable
>>>
>>> regards,
>>> dan carpenter
>>>
>>
>> alright.. so having the backlash is alright for the subject
>
> Well really my point is not so much about backslashes vs colons, it's
> about getting the *one* correct prefix.  This stuff is probably
> scriptable most of the time, but you may still be required to think a
> little on the corner cases.
>
> Here is a script to get you started.
>
> git log --format="%s" drivers/spi/dw_spi.c | \
> 	head -n 20 |                         \
> 	perl -ne 's/(.*):.*/$1/; print' |    \
> 	sort | uniq -c | sort -rn |          \
> 	perl -ne 's/^\W+\d+ //; print' |     \
> 	head -n 1
>
> regards,
> dan carpenter
>

thats a nice little script there(just ran it) any way you want to add 
this into to getmaintainers.pl or something? (this way people get the 
maintainers address plus a subject line in the mix)

Justin P. Mattock
