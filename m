From: Greg Ungerer <gregungerer00@gmail.com>
Subject: Re: [PATCH] binfmt_flat: make load_flat_shared_library() work
Date: Wed, 29 May 2019 22:29:31 +1000
Message-ID: <889fc718-b662-8235-5d60-9d330e77cf18@linux-m68k.org>
References: <20190524201817.16509-1-jannh@google.com>
 <20190525144304.e2b9475a18a1f78a964c5640@linux-foundation.org>
 <CAG48ez36xJ9UA8gWef3+1rHQwob5nb8WP3RqnbT8GEOV9Z38jA@mail.gmail.com>
 <6956cfe5-90d4-aad4-48e3-66b0ece91fed@linux-m68k.org>
 <CAK8P3a0b7MBn+84jh0Y2zhFLLAqZ2tMvFDFF9Kw=breRLH4Utg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a0b7MBn+84jh0Y2zhFLLAqZ2tMvFDFF9Kw=breRLH4Utg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel list <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Sergei Poselenov <sposelenov@emcraft.com>
List-Id: linux-m68k@vger.kernel.org


On 29/5/19 10:05 pm, Arnd Bergmann wrote:
> On Tue, May 28, 2019 at 12:56 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> On 27/5/19 11:38 pm, Jann Horn wrote:
>>> On Sat, May 25, 2019 at 11:43 PM Andrew Morton
>>> <akpm@linux-foundation.org> wrote:
>>>> On Fri, 24 May 2019 22:18:17 +0200 Jann Horn <jannh@google.com> wrote:
>>>>> load_flat_shared_library() is broken: It only calls load_flat_file() if
>>>>> prepare_binprm() returns zero, but prepare_binprm() returns the number of
>>>>> bytes read - so this only happens if the file is empty.
>>>>
>>>> ouch.
>>>>
>>>>> Instead, call into load_flat_file() if the number of bytes read is
>>>>> non-negative. (Even if the number of bytes is zero - in that case,
>>>>> load_flat_file() will see nullbytes and return a nice -ENOEXEC.)
>>>>>
>>>>> In addition, remove the code related to bprm creds and stop using
>>>>> prepare_binprm() - this code is loading a library, not a main executable,
>>>>> and it only actually uses the members "buf", "file" and "filename" of the
>>>>> linux_binprm struct. Instead, call kernel_read() directly.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Fixes: 287980e49ffc ("remove lots of IS_ERR_VALUE abuses")
>>>>> Signed-off-by: Jann Horn <jannh@google.com>
>>>>> ---
>>>>> I only found the bug by looking at the code, I have not verified its
>>>>> existence at runtime.
>>>>> Also, this patch is compile-tested only.
>>>>> It would be nice if someone who works with nommu Linux could have a
>>>>> look at this patch.
>>>>
>>>> 287980e49ffc was three years ago!  Has it really been broken for all
>>>> that time?  If so, it seems a good source of freed disk space...
>>>
>>> Maybe... but I didn't want to rip it out without having one of the
>>> maintainers confirm that this really isn't likely to be used anymore.
>>
>> I have not used shared libraries on m68k non-mmu setups for
>> a very long time. At least 10 years I would think.
> 
> I think Emcraft have a significant customer base running ARM NOMMU
> Linux, I wonder whether they would have run into this (adding
> Sergei to Cc).
> My suspicion is that they use only binfmt-elf-fdpic, not binfmt-flat.
> 
> The only architectures I see that enable binfmt-flat are sh, xtensa
> and h8300, but only arch/sh uses CONFIG_BINFMT_SHARED_FLAT

m68k uses enables it too. It is the only binary format supported
when running no-mmu on m68k. (You can use it with MMU enabled too
if you really want too).

The shared flat format has been used on m68k in the past (it was
originally developed on m68k platforms). But I haven't used them
for a long time (probably 10 years at least) on m68k.

Regards
Greg
