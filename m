From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68knommu: Mark config_BSP() __init
Date: Sun, 30 Jun 2013 12:50:19 +1000
Message-ID: <51CF9CEB.20800@uclinux.org>
References: <1372189212-12136-1-git-send-email-geert@linux-m68k.org> <51CB745B.4060604@uclinux.org> <CAMuHMdV2XakPGZP5gYygBPgg+DeSRj7qP6hF7T6nN-OQKTodtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV2XakPGZP5gYygBPgg+DeSRj7qP6hF7T6nN-OQKTodtA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Geert,

On 27/06/13 16:49, Geert Uytterhoeven wrote:
> On Thu, Jun 27, 2013 at 1:08 AM, Greg Ungerer <gerg@uclinux.org> wrote:
>> On 26/06/13 05:40, Geert Uytterhoeven wrote:
>>>
>>> Some instances of config_BSP() lack an __init annotation.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>>
>> Acked-by: Greg Ungerer <gerg@uclinux.org>
>>
>> Looks good. Are you going to push it via your tree, or do you want
>> me too?
>
> As it's m68nommu, perhaps through your tree? Unless you don't have time to
> handle it.

I can take care of it. Though I may be a little slower than usual,
I am traveling at the moment.

Regards
Greg
