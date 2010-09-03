From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: Fwd: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
 addresses in the arch directory.
Date: Fri, 03 Sep 2010 01:31:58 -0700
Message-ID: <4C80B27E.4080609@gmail.com>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-6-git-send-email-justinmattock@gmail.com> <AANLkTikTeznNoS0CMEpMe+mJKgrjpsGf-z798vA0chbB@mail.gmail.com> <alpine.OSX.2.00.1009031809380.344@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:49247 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752873Ab0ICIbd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 04:31:33 -0400
Received: by pvg2 with SMTP id 2so546523pvg.19
        for <linux-m68k@vger.kernel.org>; Fri, 03 Sep 2010 01:31:32 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1009031809380.344@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 09/03/2010 01:20 AM, Finn Thain wrote:
>
> These TIL articles are still around, and removing the article number from
> the source code is doing it damage.
>
> (I'm guessing that this change to human readable text was suggested by a
> machine...)
>
> I checked on archive.org for the URL, which lead me to
> http://kbase.info.apple.com/
> Searching the archives there for article 16405 leads to
> http://support.apple.com/kb/TA32601
> If there's a patch required (doubtful) then that's the new URL.
>

better luck than I.. i.e. I kept hitting a server error message...
Ill update this to what you posted..

Thanks....

> Patched or not, the original TIL number needs to be retained in the
> comment, since those TIL articles are also in the materials Apple has sent
> to developers over the decades, which are indexed that way.
>
> Finn
>
>
> On Fri, 3 Sep 2010, Geert Uytterhoeven wrote:
>
>> linux-alpha was the wrong list?
>>
>> ---------- Forwarded message ----------
>> From: Justin P. Mattock<justinmattock@gmail.com>
>> Date: Thu, Sep 2, 2010 at 23:08
>> Subject: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
>> addresses in the arch directory.
>> To: trivial@kernel.org
>> Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
>> jkosina@suse.cz, "Justin P. Mattock"<justinmattock@gmail.com>
>>
>>
>> The below patch updates a broken web address that is no longer
>> working due to company buyout, and/or change of location.
>> (Please have a look through, and let me know if any of them
>> need to be changed, and I'll resend an updated patch).
>>
>> Signed-off-by: Justin P. Mattock<justinmattock@gmail.com>
>>
>> ---
>>   arch/m68k/mac/macboing.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/m68k/mac/macboing.c b/arch/m68k/mac/macboing.c
>> index 8f06408..e1e3377 100644
>> --- a/arch/m68k/mac/macboing.c
>> +++ b/arch/m68k/mac/macboing.c
>> @@ -114,7 +114,7 @@ static void mac_init_asc( void )
>>                          *   16-bit I/O functionality.  The PowerBook
>> 500 series computers
>>                          *   support 16-bit stereo output, but only mono input."
>>                          *
>> -                        *
>> http://til.info.apple.com/techinfo.nsf/artnum/n16405
>> +                        *   http://www.apple.com/
>>                          *
>>                          * --David Kilzer
>>                          */
>> --
>> 1.7.2.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
>>
>>
>>
