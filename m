Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FFBC2BA2B
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 12:42:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30BD3206E9
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 12:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="mV4e325S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgDLMmR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 08:42:17 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34386 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgDLMmQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 08:42:16 -0400
Received: by mail-ot1-f68.google.com with SMTP id m2so6547879otr.1
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=mMJmXtGmwQcS60/5n3zZVplNSb/etyqalzHitiJ1WTk=;
        b=mV4e325STlgqkkURQ3wfMZwnjjSI2v95rNKwfUkcslriEDc9OOYM1uByucpwe80Piu
         6pWOOsJyM2nGZO7X3iSjNBSV5odbNRBsPcqERipVZBRveUP3WqZtUMEj4e2Zsafol5J5
         CU4ZwznBpHB0xhyRFhtwl+5+AB+IhZgZ/ooYlO5I6HH68mxx2yBolN40XvGtYezN5vVF
         ZcwjBs9nrL9HCPtBZKMAAPNAwMTJPS4EB4DTld9anmCoj/MipaxSfNsxIRpMY+pV8H/5
         VNZ8GXKhVUA5y79Yz7L0wE5Kn7Q/fkbirLJ0QhWMQtpcrJUvnVaA5l8RJHYQcZA3SClC
         /5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mMJmXtGmwQcS60/5n3zZVplNSb/etyqalzHitiJ1WTk=;
        b=fzoQEf+VyyHqcZCbqnRbl21JeE0B+hrnm330S7aS1rHAdmONy6d/zBDhBUNvo7Xy+r
         KU8TV3Q/SXlJNnHVBU4M9ovMou7E5xgqbyC81p3oK4fJAiLISzU4DE/JpDyJQ7aBatH0
         KQ13WDPLUpKbf/sV49jd1MhKQhb/H8gAch14XkVI1mx/Gd3kfNXZdROHUhxm3ZxQ5299
         xfz/+yHMA5mlz70YW4JbKW9VZW7p8Ex/zmiQWJReBXT5xKfvjC7RSMtJpH4EXq9QVyGQ
         S3lu3kcuSBrMx3poRTekRaMe9Gfo3FMUaww90n/eDaWonQvaUqmkM8hf5Pa8/oLj3awd
         0deA==
X-Gm-Message-State: AGi0PuaMjGAbRi8Aqv+u1ELyhbhq9kf+mwE7Z1V2RxWiVN1EKWxMF85D
        Nlp77Y1c2BTzcnKnpqsrUW5LTmQuEBc=
X-Google-Smtp-Source: APiQypKMbDZXTpU879XDtSj3NotYCkoRJMlObQw9WNSGoiaY1wb1vFQu6PRamI9coS4DTZu9LDCjlg==
X-Received: by 2002:a9d:525:: with SMTP id 34mr10595868otw.80.1586695336226;
        Sun, 12 Apr 2020 05:42:16 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id n2sm1690032oom.18.2020.04.12.05.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2020 05:42:15 -0700 (PDT)
Subject: Re: Running m68k on qemu with external initramfs?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
Date:   Sun, 12 Apr 2020 07:48:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/11/20 7:12 AM, John Paul Adrian Glaubitz wrote:
> Hi Rob!

Hello.

> On 4/11/20 2:50 AM, Rob Landley wrote:
>> I'm adding m68k support to toybox's "make root" target and I have a kernel and a
>> rootfs.cpio.gz, but qemu's -initrd option doesn't put the rootfs image somewhere
>> the m68k kernel can find it.
> 
> Can you try whether this guide works for you with your version of qemu?
> 
>> https://wiki.debian.org/M68k/QemuSystemM68k

Install debian to a block device to see why initramfs isn't working?

I already downloaded and ran
http://landley.net/aboriginal/downloads/binaries/system-image-m68k.tar.gz to
make sure laurent's tip of tree qemu-m68k is working, and that booted to a shell
prompt fine, but that's using a static initramfs instead of an external once,
which is why I thought that was the issue. (It used to be back when I first made
that work, which was something like 2014.)

I also ran my toybox binary under qemu-m68k to smoketest that the compiler was
making binaries that ran, but it turns out that I had two problems:

1) I'd run "make defconfig in the wrong directory and toybox switched the shell
back off (because it's still in "pending" until I finish it), hence the not
finding init. I stuck enough printk(KERN_ERR) into init/initramfs.c to list all
the filenames it was extracting and figured that one out.

2) THEN the problem was that gcc is doing something in cd_main so that the
"chdir ." at the start of the shell setup (to set $PWD and friends) is
segfaulting, but it's a segfault that went away when I got near it with printf()
calls, and even write(1, "", 0); right before it made it go away. Given that
this code has run on 32 and 64 bit, big and little endian, glibc musl and
bionic, and on a target that's both nommu and cares about alignment?

Someday I might build gdb for m68k, but until then I should check it next time I
upgrade compiler versions. (Or go through disabling every optimization one by
one until I find the one that's making the registers go nuts the way sh4 had
that https://landley.net/notes-2020.html#29-01-2020 thing.)

Rob

P.S: For context, I built a musl-cross-make toolchain and symlinked it into
toybox, and then used "make root CROSS=m68k LINUX=~/linux" to build a system:

git clone https://github.com/landley/musl-cross-make
git clone https://github.com/landley/toybox
cd musl-cross-make
sed -Ei 's/(BINUTILS_VER =).*/\1 2.32/;s/(LINUX_VER =).*/\1 4.19.90/' Makefile
../toybox/scripts/mcm-buildall.sh i686:: m68k::
cd ../toybox
ln -s ccc ../musl-cross-make/ccc
make root CROSS=i686 LINUX=~/linux
make root CROSS=m68k LINUX=~/linux

If you (cd root/i686; ./qemu-*.sh) it boots to a shell prompt.... well, if you
KARGS=rdinit=/bin/sh it does, running the init script still says:

ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
ln: cannot create symbolic link from '/proc/self/fdi/,*/}' to 'dev/i/*,/}': No y
sh: exec /etc/rc/*: No such file or directory
Type exit when done.
oneit: /dev/CONSOLE:-console}: No such file or directory

Because I'm still halfway through teaching toysh about all the ${} constructs.
(Also, remind me to stick echo -e '\e[?7h' at the start of my init script to
undo the STUPID wordwrap disable escape that qemu's bios outputs, which screws
up bash's command line history too!)

Anyway, at least it's known behavior. But in root/m68k I'm getting:

Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
CPU: 0 PID: 1 Comm: init Not tainted 5.6.0 #1
Stack from 0f81bdfc:

But I just went over that in the previous email I sent (downside of having two
reply windows open at once), and am clicking "send" on this now because the
sun's coming up and I should have been in bed a while ago. Sorry if it's
duplicative.

P.P.S. Zzzzzzz....
