From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68k: generalize uboot command line support
Date: Fri, 9 Sep 2016 22:27:32 +1000
Message-ID: <2e692fe4-67b8-36d5-262b-cedff400f262@linux-m68k.org>
References: <1473405228-928-1-git-send-email-gerg@linux-m68k.org>
 <CAMuHMdUKLufiHyRuo3HhrXZ-fcDK5=qQ3mMsguKk2xBXtbrnjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:16713
        "EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751332AbcIIM1h (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 9 Sep 2016 08:27:37 -0400
In-Reply-To: <CAMuHMdUKLufiHyRuo3HhrXZ-fcDK5=qQ3mMsguKk2xBXtbrnjQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 09/09/16 17:33, Geert Uytterhoeven wrote:
> Hi Greg,
>
> On Fri, Sep 9, 2016 at 9:13 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> The uboot command line support needs to be used by both MMU and no-MMU
>> setups, but currently we only have the code in the no-MMU code paths.
>> Move the uboot command line processing code into its own file. Add
>> appropriate calls to it from both the MMU and no-MMU arch setup code.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> If you want me to take this through the m68k tree instead, just let me know.
> Thanks!

Thanks. I have a few things queued (with the ColdFire 54411 MMU
changes) so I don't mind taking this one too.

Regards
Greg
