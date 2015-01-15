From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 12 (build failures: m68k, ppc)
Date: Thu, 15 Jan 2015 06:09:25 -0800
Message-ID: <54B7CA15.7000200@roeck-us.net>
References: <20150112180322.003b44f2@canb.auug.org.au>	<20150112162438.GA18723@roeck-us.net>	<CAMuHMdUYEe=L=H75AOYVjinRSW=okRJNrNJVy-bY1gshdVrO7Q@mail.gmail.com>	<20150112175920.GC19868@roeck-us.net> <CAMuHMdV1k4viMKmi_8vM52iz+ry50k=Ard1ADkEGzia+yJ5e3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV1k4viMKmi_8vM52iz+ry50k=Ard1ADkEGzia+yJ5e3Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

On 01/15/2015 02:12 AM, Geert Uytterhoeven wrote:
> On Mon, Jan 12, 2015 at 6:59 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>> Build failures, seen since next-20150109:
>>>>          m68k:allmodconfig
>>>>          powerpc:ppc6xx_defconfig
>
> It looks like parisc is also suffering:
> http://kisskb.ellerman.id.au/kisskb/buildresult/12343847/
>
>>>> Due to:
>>>>          ERROR: "__get_user_bad" [drivers/gpu/drm/drm.ko] undefined!
>>>>          make[1]: *** [__modpost] Error 1
>>>>
>>>> Caused by commit d34f20d6e2f (drm: Atomic modeset ioctl).
>>>
>>> Yeah, it needs a get_user() that supports 64-bit data.
>>>
>> Hi Geert,
>>
>> I assume you mean m68k, where 64 bit support for get_user has been disabled.
>>
>> The problem on powerpc is different though: __get_user_nocheck()
>> and __get_user_check() use
>>          unsigned long __gu_val;
>> followed by
>>          __get_user_size(__gu_val, __gu_addr, (size), __gu_err);
>>
>> __get_user_size() fails in
>>          if (size > sizeof(x))
>>                   (x) = __get_user_bad();
>>
>> Presumably "unsigned long" is 32 bit on 32 bit powerpc, not 64 bit.
>>
>> Overall, the explicit 64-bit use of get_user() seems to be quite unusual.
>
> I noticed you've sent a fix for DRM.
>
> Doh, and I was just fixing m68k...
>

Sorry, should have Cc:'d you.

Guenter
