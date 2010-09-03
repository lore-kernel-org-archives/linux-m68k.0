From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: Fwd: [PATCH 35/91] arch/m68k/q40/README Update broken web addresses
 in the arch directory.
Date: Fri, 03 Sep 2010 02:04:21 -0700
Message-ID: <4C80BA15.1000203@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-5-git-send-email-justinmattock@gmail.com> <AANLkTimyRsVmeeM-mNwAm8uwhAEYZx4Wx56=ARy=tttO@mail.gmail.com> <alpine.OSX.2.00.1009031821450.344@localhost> <4C80B350.6050006@gmail.com> <alpine.OSX.2.00.1009031837380.344@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:37181 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754432Ab0ICJD5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 05:03:57 -0400
Received: by pvg2 with SMTP id 2so554921pvg.19
        for <linux-m68k@vger.kernel.org>; Fri, 03 Sep 2010 02:03:56 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1009031837380.344@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 09/03/2010 01:47 AM, Finn Thain wrote:
>
> On Fri, 3 Sep 2010, Justin P. Mattock wrote:
>
>> On 09/03/2010 01:23 AM, Finn Thain wrote:
>>>
>>> URLs can't be split across lines usefully, so disregard the checkpatch
>>> complaint.
>>>
>>> Finn
>>>
>>
>> with the coding style, what files should ignore coding style with the tab rule
>> i.e. Kconfig *.c, *.h, README, etc...
>> (from here Kconfig make sense due to the ncurses interface..)
>
> I'm not sure what you mean (?)
>
> Kconfig seems to use the<...>  syntax for URLs. checkpatch doesn't
> complain about the ~90 character long URL in ./drivers/scsi/Kconfig...
>
> Finn
>

yeah this is a bit confusing, especially with checkpatch in the mix.. So 
if I understand correctly, using checkpatch, any address that uses the 
column limit:
(example)
+   http://web.archive.org/web/*/http://www.unix-ag.org/Linux-Alpha/
+   Architectures/Avanti.html.

breaks checkpatch(without the <.....>) in any of the files?
as for Kconfig make the url long so the she looks pretty for the user..



>>
>>> On Fri, 3 Sep 2010, Geert Uytterhoeven wrote:
>>>
>>>> ---------- Forwarded message ----------
>>>> From: Justin P. Mattock<justinmattock@gmail.com>
>>>> Date: Thu, Sep 2, 2010 at 23:08
>>>> Subject: [PATCH 35/91] arch/m68k/q40/README Update broken web
>>>> addresses in the arch directory.
>>>> To: trivial@kernel.org
>>>> Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
>>>> jkosina@suse.cz, "Justin P. Mattock"<justinmattock@gmail.com>
>>>>
>>>>
>>>> The below patch updates a broken web address that is no longer
>>>> working due to company buyout, and/or change of location.
>>>> (Please have a look through, and let me know if any of them
>>>> need to be changed, and I'll resend an updated patch).
>>>>
>>>> Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>>>
>>>> ---
>>>>    arch/m68k/q40/README |    8 ++++----
>>>>    1 files changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/m68k/q40/README b/arch/m68k/q40/README
>>>> index 6bdbf48..0d26762 100644
>>>> --- a/arch/m68k/q40/README
>>>> +++ b/arch/m68k/q40/README
>>>> @@ -1,10 +1,10 @@
>>>>    Linux for the Q40
>>>>    =================
>>>>
>>>> -You may try http://www.geocities.com/SiliconValley/Bay/2602/ for
>>>> -some up to date information. Booter and other tools will be also
>>>> -available from this place or ftp.uni-erlangen.de/linux/680x0/q40/
>>>> -and mirrors.
>>>> +You may try http://web.archive.org/web/*/http://geocities.com/
>>>> +SiliconValley/Bay/2602/ for some up to date information. Booter
>>>> +and other tools will be also available from this place or
>>>> +http://www.linux-m68k.org/mail.html and mirrors.
>>>>
>>>>    Hints to documentation usually refer to the linux source tree in
>>>>    /usr/src/linux/Documentation unless URL given.
>>>> --
>>>> 1.7.2.1
>>>>
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>> Please read the FAQ at  http://www.tux.org/lkml/
>>>>
>>>>
>>>>
>>
>>
>
