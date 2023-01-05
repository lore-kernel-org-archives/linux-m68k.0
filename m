Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48372C3DA7A
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Jan 2023 22:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234508AbjAEWBW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 Jan 2023 17:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbjAEWBT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 5 Jan 2023 17:01:19 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFAC67BEF
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Jan 2023 14:01:18 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id i20so31255614qtw.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Jan 2023 14:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AiDogmSekfQ136iq07144KY/Kq2S6U3J1wMNG/6kVak=;
        b=fMVHXBR9f8COfqWuTLGIOdUfjxsWONJHOpmAedSE6QNMQXzIKWtSIeEaIowL951f6a
         v2/YTCyesQk0a+DcPRVmUX9F+EVNzVbxhY0/Wqa9dKGl36gIUUMd60gbkZsuFHkclYV3
         Tw1uzLULJMgrKgxKfeXDnbaa5pFPV+dBFzP0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AiDogmSekfQ136iq07144KY/Kq2S6U3J1wMNG/6kVak=;
        b=r4JXLtfFPBmI1UhnI/zkRUz6/o9uK8QBThDdfpYC0YcP92UaBWm12nnnT0p2KIN18b
         y8Pgzij3IGASe1kqh1XKRaqXLBPWt4+a5AO/+vAgXI6ujxvryDcHgGzDrzT+3qvSvZh4
         hMENedrYh7gbc+o0XH+h1dahUAVdcdKxoO1NzFNiL7WMvtnapk7a/8ov3fcfXmxMUMlN
         iWC6dZxrfym951QC1FKkU+qlQ9FajTL/mTkeLUo7KcRAVvubx1vGDPsqbUSv409qfpSb
         CG+A8viO5KVDd8ullwhvCA1p9cHVgl35J4GpEO/P5X9qEPkxYqhRGR7ARhpBaLwqvz/x
         +7hQ==
X-Gm-Message-State: AFqh2koHN26FY9kDT2WSi2oHww4zFeStRsplGdYVkLV0CzavpeJ9Sxsg
        v26zZfj8AZJzA25jV+sUfzuBzXa5jOMSzHoa
X-Google-Smtp-Source: AMrXdXt52yFUUSADfN22AQVzPeyvCLTZzqxw2eAdxLO/nNdNoy59/CVwk2y71CKeYykaEQ8NfxvISg==
X-Received: by 2002:a05:622a:a18:b0:3a5:8b:7719 with SMTP id bv24-20020a05622a0a1800b003a5008b7719mr71981513qtb.65.1672956077627;
        Thu, 05 Jan 2023 14:01:17 -0800 (PST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id b23-20020ac87557000000b003a5c60686b0sm21996081qtr.22.2023.01.05.14.01.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 14:01:17 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id x11so31251856qtv.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Jan 2023 14:01:17 -0800 (PST)
X-Received: by 2002:a37:a93:0:b0:6ff:812e:a82f with SMTP id
 141-20020a370a93000000b006ff812ea82fmr2294231qkk.336.1672955655473; Thu, 05
 Jan 2023 13:54:15 -0800 (PST)
MIME-Version: 1.0
References: <000000000000dbce4e05f170f289@google.com> <5f45bb9a-5e00-48dd-82b0-46b19b1b98a3@app.fastmail.com>
 <CAHk-=wi8XyAUF9_z6-oa4Ava6PVZeE-=TVNcFK1puQHpOtqLLw@mail.gmail.com>
 <ab7a9477-ddc7-430f-b4ee-c67251e879b0@app.fastmail.com> <1bd49fc0-d64f-4eb8-841a-4b09e178b5fd@gmail.com>
In-Reply-To: <1bd49fc0-d64f-4eb8-841a-4b09e178b5fd@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Jan 2023 13:53:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg3U3Y6eaura=xQzTsktpEOMETYYnue+_KSbQmpg7vZ0Q@mail.gmail.com>
Message-ID: <CAHk-=wg3U3Y6eaura=xQzTsktpEOMETYYnue+_KSbQmpg7vZ0Q@mail.gmail.com>
Subject: Re: [syzbot] [hfs?] WARNING in hfs_write_inode
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        syzbot <syzbot+7bb7cd3595533513a9e7@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        christian.brauner@ubuntu.com,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        jlayton@kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        Matthew Wilcox <willy@infradead.org>,
        ZhangPeng <zhangpeng362@huawei.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        linux-m68k@lists.linux-m68k.org, flar@allandria.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 5, 2023 at 1:35 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Looking at Linus' patch, I wonder whether the missing fd.entrylength
> size test in the HFS_IS_RSRC(inode) case was due to the fact that a
> file's resource fork may be empty?

But if that is the case, then the subsequent hfs_bnode_read would
return garbage, no? And then writing it back after the update would be
even worse.

So adding that

+               if (fd.entrylength < sizeof(struct hfs_cat_file))
+                       goto out;

would seem to be the right thing anyway. No?

But I really don't know the code, so this is all from just looking at
it and going "that makes no sense". Maybe it _does_ make sense to
people who have more background on it.

             Linus
