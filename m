Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E16EB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 07:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGUHec (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 03:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGUHeb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 03:34:31 -0400
X-Greylist: delayed 6696 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Jul 2023 00:34:30 PDT
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A03119B0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 00:34:29 -0700 (PDT)
Received: from in01.mta.xmission.com ([166.70.13.51]:53604)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1qMiuc-004rM4-GD; Thu, 20 Jul 2023 23:42:46 -0600
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:56814 helo=email.froward.int.ebiederm.org.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1qMiub-00FWv4-7X; Thu, 20 Jul 2023 23:42:45 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Viacheslav Dubeyko <slava@dubeyko.com>,
        Matthew Wilcox <willy@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        syzbot <syzbot+7bb7cd3595533513a9e7@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        christian.brauner@ubuntu.com,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Jeff Layton <jlayton@kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com,
        ZhangPeng <zhangpeng362@huawei.com>,
        linux-m68k@lists.linux-m68k.org
References: <000000000000dbce4e05f170f289@google.com>
        <5f45bb9a-5e00-48dd-82b0-46b19b1b98a3@app.fastmail.com>
        <CAHk-=wi8XyAUF9_z6-oa4Ava6PVZeE-=TVNcFK1puQHpOtqLLw@mail.gmail.com>
        <ab7a9477-ddc7-430f-b4ee-c67251e879b0@app.fastmail.com>
        <2575F983-D170-4B79-A6BA-912D4ED2CC73@dubeyko.com>
        <46F233BB-E587-4F2B-AA62-898EB46C9DCE@dubeyko.com>
        <Y7bw7X1Y5KtmPF5s@casper.infradead.org>
        <50D6A66B-D994-48F4-9EBA-360E57A37BBE@dubeyko.com>
        <CACT4Y+aJb4u+KPAF7629YDb2tB2geZrQm5sFR3M+r2P1rgicwQ@mail.gmail.com>
Date:   Fri, 21 Jul 2023 00:40:26 -0500
In-Reply-To: <CACT4Y+aJb4u+KPAF7629YDb2tB2geZrQm5sFR3M+r2P1rgicwQ@mail.gmail.com>
        (Dmitry Vyukov's message of "Thu, 20 Jul 2023 17:27:57 +0200")
Message-ID: <87y1j9ddpx.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1qMiub-00FWv4-7X;;;mid=<87y1j9ddpx.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19b4haWTJRkCzfHy8zsGBgQylRh8f4gAnE=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [syzbot] [hfs?] WARNING in hfs_write_inode
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Dmitry Vyukov <dvyukov@google.com> writes:

> On Thu, 5 Jan 2023 at 17:45, Viacheslav Dubeyko <slava@dubeyko.com> wrote:
>> > On Wed, Jan 04, 2023 at 08:37:16PM -0800, Viacheslav Dubeyko wrote:
>> >> Also, as far as I can see, available volume in report (mount_0.gz) somehow corrupted already:
>> >
>> > Syzbot generates deliberately-corrupted (aka fuzzed) filesystem images.
>> > So basically, you can't trust anything you read from the disc.
>> >
>>
>> If the volume has been deliberately corrupted, then no guarantee that file system
>> driver will behave nicely. Technically speaking, inode write operation should never
>> happened for corrupted volume because the corruption should be detected during
>> b-tree node initialization time. If we would like to achieve such nice state of HFS/HFS+
>> drivers, then it requires a lot of refactoring/implementation efforts. I am not sure that
>> it is worth to do because not so many guys really use HFS/HFS+ as the main file
>> system under Linux.
>
>
> Most popular distros will happily auto-mount HFS/HFS+ from anything
> inserted into USB (e.g. what one may think is a charger). This creates
> interesting security consequences for most Linux users.
> An image may also be corrupted non-deliberately, which will lead to
> random memory corruptions if the kernel trusts it blindly.

I am going to point out that there are no known linux filesystems
that are safe to mount when someone has written a deliberately
corrupted filesystem on a usb stick.

Some filesystems like ext4 make a best effort to fix bugs of this sort
as they are discovered but unless something has changed since last I
looked no one makes the effort to ensure that it is 100% safe to mount
any possible corrupted version of any Linux filesystem.

If there is any filesystem in Linux that is safe to automount from
an untrusted USB stick I really would like to hear about it.  We could
allow mounting them in unprivileged user namespaces and give all kinds
of interesting capabilities to our users.

As it is I respectfully suggest that if there is a security issue it is
the userspace code that automounts any filesystem on an untrusted USB
stick.

Eric




