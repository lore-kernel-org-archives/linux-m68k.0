Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E7EC54EBF
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Jan 2023 00:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbjAEAhY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 4 Jan 2023 19:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235701AbjAEAhE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 4 Jan 2023 19:37:04 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288EEBA7
        for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Jan 2023 16:37:03 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id v14so26035899qtq.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Jan 2023 16:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20210112.gappssmtp.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4eXR7+DTXCTaYZ/SdHjg2xu1hwBwg3cWqSb9OuDM9Y=;
        b=RuWR1y5qjlv+GrqbkjNVxnJ1b79YNDxZsoLwsEER/oFFJBQm5x6N9YstduZzZTb6Rm
         pGK1H1fm2x5F7gELgYGhzi7BuYAnEKvZrjR+ACIhtJ/5c45nyHeQ6tYXlnkNSPriDycX
         xzWbn4hDyZ9glm+F30XNjlcnEFGnrD0VhhtIoMqJhOccznsqLSvEj58av5OuRCjiNKJa
         i5fHnglchNjxLo+XCOSrsVIMEEcpgfQHaMEFVWYgZqSeGa7z1uToZeqW8E52S9DS2WjS
         z5+gpoqxe0oxAbByAKWECScZ2UoJwiCZUsNRUarxMQQwG8fhfqnfmUtzUPD9veXfJnI0
         bkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4eXR7+DTXCTaYZ/SdHjg2xu1hwBwg3cWqSb9OuDM9Y=;
        b=F2rZ62GQm6BntA+NjjKqGURV1tjsjrAYIhgfO1YZ+KAD9vfBGre+zlXGaOCGBqfyZF
         VOQ5/JCB8mQz2Qk00gZXzBBNxFPLjaAZMy1gsxArPGmeTj7tSbYLsq20fan8W4Dd9RD1
         jZHWJ9mly2LwbCZVw0pBOqOfbeD9sTr5fh91aK1BmJY7ySgXgY+p14B4q0XOUOOsofVf
         07aq33PwJ9vu9zdxeAbqMCOSLp32IH7j1ZtOeko9YkNrLVqv5UKgahKVbf/uwsH/WA5N
         LnzQyugE2kMqkISIMSSNtuhddhRObwd9qR+GoGEVBvEeL4wTlTeR9wqYEld4xpZlHMi+
         KnyQ==
X-Gm-Message-State: AFqh2kow3iTwg+w+WETikK35dDDtMx7BzrdjvcgpC5n6oZms0YO8x0fR
        U5qcsWlTw3llXGiicNq2316KAQ==
X-Google-Smtp-Source: AMrXdXvZgQTTb4PUtMb76x1Pe4izfq9PQPMxvPuvugTAIW0gC2/RPdPwYROSYBilceCjmxuBfEoSag==
X-Received: by 2002:ac8:7450:0:b0:3a7:e599:1ee0 with SMTP id h16-20020ac87450000000b003a7e5991ee0mr59001669qtr.63.1672879022216;
        Wed, 04 Jan 2023 16:37:02 -0800 (PST)
Received: from smtpclient.apple (172-125-78-211.lightspeed.sntcca.sbcglobal.net. [172.125.78.211])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87744000000b003a7f597dc60sm20987642qtu.72.2023.01.04.16.36.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Jan 2023 16:37:01 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [syzbot] [hfs?] WARNING in hfs_write_inode
From:   Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <ab7a9477-ddc7-430f-b4ee-c67251e879b0@app.fastmail.com>
Date:   Wed, 4 Jan 2023 16:36:51 -0800
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        syzbot <syzbot+7bb7cd3595533513a9e7@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        christian.brauner@ubuntu.com,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Jeff Layton <jlayton@kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com,
        Matthew Wilcox <willy@infradead.org>,
        ZhangPeng <zhangpeng362@huawei.com>,
        linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2575F983-D170-4B79-A6BA-912D4ED2CC73@dubeyko.com>
References: <000000000000dbce4e05f170f289@google.com>
 <5f45bb9a-5e00-48dd-82b0-46b19b1b98a3@app.fastmail.com>
 <CAHk-=wi8XyAUF9_z6-oa4Ava6PVZeE-=TVNcFK1puQHpOtqLLw@mail.gmail.com>
 <ab7a9477-ddc7-430f-b4ee-c67251e879b0@app.fastmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

> On Jan 4, 2023, at 2:33 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> On Wed, Jan 4, 2023, at 20:06, Linus Torvalds wrote:
>>=20
>> I suspect this code is basically all dead. =46rom what I can tell, =
hfs
>> only gets updates for
>>=20
>> (a) syzbot reports
>>=20
>> (b) vfs interface changes
>=20
> There is clearly no new work going into it, and most data exchange
> with MacOS would use HFS+, but I think there are still some users.
>=20
>> and the last real changes seem to have been by Ernesto A. Fern=C3=A1nde=
z
>> back in 2018.
>>=20
>> Hmm. Looking at that code, we have another bug in there, introduced =
by
>> an earlier fix for a similar issue: commit 8d824e69d9f3 ("hfs: fix =
OOB
>> Read in __hfs_brec_find") added
>>=20
>> +       if (HFS_I(main_inode)->cat_key.CName.len > HFS_NAMELEN)
>> +               return -EIO;
>>=20
>> but it's after hfs_find_init(), so it should actually have done a
>> hfs_find_exit() to not leak memory.
>>=20
>> So we should probably fix that too.
>>=20
>> Something like this ENTIRELY UNTESTED patch?
>>=20
>> Do we have anybody who looks at hfs?
>=20
> Adding Viacheslav Dubeyko to Cc, he's at least been reviewing
> patches for HFS and HFS+ somewhat recently. The linux-m68k
> list may have some users dual-booting old MacOS.
>=20
> Viacheslav, see the start of the thread at
> https://lore.kernel.org/lkml/000000000000dbce4e05f170f289@google.com/
>=20

Let me take a look into the issue.

Thanks,
Slava.


