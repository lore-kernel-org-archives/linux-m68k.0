Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E2CEB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 06:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjGUGnE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 02:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjGUGnC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 02:43:02 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB4E113
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 23:42:59 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so13939565e9.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689921777; x=1690526577;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nZ2UjtJkJatqkl69pOrJuBy1CF5MniKXwLw/NTDggw=;
        b=JPudhTqrkma+6DrU2mBTAIjKltl7VwyWyIdTjCrSLqpYo1uNrTaI0EKwF7BxrvTtim
         knRkn68kKGmOlO+CxZf9tFM/EKk1cH1TRez68fCPz0v7gY5BvRTDlY6gznNCEIZsVjo1
         xYkaln6qYKDpKnERZCEfeIp6gRHk1jUtjEOdY2i7NqaDaanc/YdwhIKcqdHBLIJyyXp0
         aC4nf2ZJSkHzU/7B1JMLXl3zUDMJpuSoaeRVCRf7Jhrx9wSn8T6TM/hfsBYqjn0iIdKR
         XtJso2ZI+uMpgwRPwOR4xxs7wyYOS41HgTc+OkWl11eM2YMJdNyRCOwKHLtFqrNNHLCm
         myWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689921777; x=1690526577;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nZ2UjtJkJatqkl69pOrJuBy1CF5MniKXwLw/NTDggw=;
        b=C/xkkButFLJlBp/BrR2xDk8v2ip4mrqm9/xI26/GvhZLwr3PPXXN5o4xkc30PBGvmY
         vovOMK7ecZFtAKzx9hbjZ7lrJ5cqCr8otmOJrJXxO+9haFbjl6HwiEl5QzLawEGYBIQm
         8xXJindtZ8fOz76Y6wvc4xGEFoOwUAF/c0ukp9AqyZjgAc2Y/BMV6hAfmFp+jP891zzh
         ywk1wQ9x0IoJkw1757Zj+VDfmtXSo5y2iGVki2YvDmzHHBvX1c1WGo5Zt0A4FFO7tvej
         GhND4/+c+y8LJlnzQOD11t5AAtKu81rlZeLVpPHCpfV1pcPlQtez7r/8fQ5W/TmmYl/+
         O6xg==
X-Gm-Message-State: ABy/qLYBPrMl5+3PgT80hNsHn5TUb1wnlvanSCrXvVbzbfznWd8SiykV
        ydNhi2Cs7rGtkLoFeYYFFeQ=
X-Google-Smtp-Source: APBJJlFEnQe43nLu/D7LH9v9SV9nG1WKz+uvgZ8xZePV2QZj91PxIrCNwbdfC1vCgKGnFacLOir6Hw==
X-Received: by 2002:a05:600c:b58:b0:3fb:b1fd:4183 with SMTP id k24-20020a05600c0b5800b003fbb1fd4183mr726368wmr.12.1689921777366;
        Thu, 20 Jul 2023 23:42:57 -0700 (PDT)
Received: from smtpclient.apple ([2a02:c7c:aa7e:f200:f068:3acd:7e6c:5221])
        by smtp.gmail.com with ESMTPSA id s13-20020a7bc38d000000b003fbd0c50ba2sm5498355wmj.32.2023.07.20.23.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 23:42:56 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Kirsten Bromilow <kirsten1@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [syzbot] [hfs?] WARNING in hfs_write_inode
Date:   Fri, 21 Jul 2023 07:42:46 +0100
Message-Id: <FE018F29-9CBB-471B-AB93-C4701AD9C4B1@gmail.com>
References: <ZLnbN4Mm9L5wCzOK@casper.infradead.org>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Dave Chinner <david@fromorbit.com>,
        Jeff Layton <jlayton@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        syzbot <syzbot+7bb7cd3595533513a9e7@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        christian.brauner@ubuntu.com,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com,
        ZhangPeng <zhangpeng362@huawei.com>,
        linux-m68k@lists.linux-m68k.org,
        debian-ports <debian-ports@lists.debian.org>
In-Reply-To: <ZLnbN4Mm9L5wCzOK@casper.infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
X-Mailer: iPhone Mail (20D67)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Please stop sending these emails to me and remove me from the recipient list=
?
!

Sent from my iPhone

> On 21 Jul 2023, at 02:27, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> =EF=BB=BFOn Fri, Jul 21, 2023 at 11:03:28AM +1000, Finn Thain wrote:
>> On Fri, 21 Jul 2023, Dave Chinner wrote:
>>=20
>>>> I suspect that this is one of those catch-22 situations: distros are=20=

>>>> going to enable every feature under the sun. That doesn't mean that=20
>>>> anyone is actually _using_ them these days.
>>=20
>> I think the value of filesystem code is not just a question of how often=20=

>> it gets executed -- it's also about retaining access to the data collecte=
d=20
>> in archives, museums, galleries etc. that is inevitably held in old=20
>> formats.
>=20
> That's an argument for adding support to tar, not for maintaining
> read/write support.
>=20
>>> We need to much more proactive about dropping support for unmaintained=20=

>>> filesystems that nobody is ever fixing despite the constant stream of=20=

>>> corruption- and deadlock- related bugs reported against them.
>>=20
>> IMO, a stream of bug reports is not a reason to remove code (it's a reaso=
n=20
>> to revert some commits).
>>=20
>> Anyway, that stream of bugs presumably flows from the unstable kernel API=
,=20
>> which is inherently high-maintenance. It seems that a stable API could be=
=20
>> more appropriate for any filesystem for which the on-disk format is fixed=
=20
>> (by old media, by unmaintained FLOSS implementations or abandoned=20
>> proprietary implementations).
>=20
> You've misunderstood.  Google have decided to subject the entire kernel
> (including obsolete unmaintained filesystems) to stress tests that it's
> never had before.  IOW these bugs have been there since the code was
> merged.  There's nothing to back out.  There's no API change to blame.
> It's always been buggy and it's never mattered before.
>=20
> It wouldn't be so bad if Google had also decided to fund people to fix
> those bugs, but no, they've decided to dump them on public mailing lists
> and berate developers into fixing them.
>=20
