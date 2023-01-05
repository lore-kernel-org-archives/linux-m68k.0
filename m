Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01469C4708E
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Jan 2023 23:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236043AbjAEXqV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 Jan 2023 18:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236089AbjAEXqR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 5 Jan 2023 18:46:17 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549B72F792
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Jan 2023 15:46:15 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id y1so5500460plb.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Jan 2023 15:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcNYdCkU7Ye6vOpPqW6hRFnDiMLJqgUtfa+zzQzXpcQ=;
        b=pgMpjIhnYxA6n/oE+DSs8NDG7njrcPJ97sbQX4mfyTzi3uxgHwGBBg5ZL6Of+Vt5yw
         KMbZidTCpxRjaW7XYnxY1yrgftHZLrKSXjkzmvl9t77ixdnjoSNA9YjuHW6roIjtZlbj
         dlgcA6yMTV5Fup62i05KwyqCau0YbmX9lqvbUqQzKyUga58wfaRODs+DkcslHVr8Z7jE
         zrNOt2kaFfNjrsaJo9n8KpmyZQM7XtBrTlJPChUum1hGWymrRe6Ea//oP9JGRc6Ejoap
         42bbQ+TPcewFJs8b6TYYpa1WM5ho4Nfgwoec81gZS+HyUFG21SfNGbCIq1hY3ynJb40L
         COFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wcNYdCkU7Ye6vOpPqW6hRFnDiMLJqgUtfa+zzQzXpcQ=;
        b=shzhueXeph/GWFSuVZR2eqhxVnBcnerWdrYo6gAsTbnepXTE4vAIteT0i+WYACn9Vj
         GCquE8EXl+PbvxYXG4+mQj/8LZWqtAb5VOCQ4bw1vlO5VlEDlACOkE3+0E1+ZQZvx3g7
         HVovDsbHyVUyLvgUN7kD6RK8mGXBQCJedcepOgpWcWtZoBNX7uhOvg/DenSi5I2+pDPw
         E43jp9brhqZ+Yg+9D030GheVZDAp+0RFOc+i4VGv5gcpi5njbGXCQSJqSb5gFv8amg7j
         tNrIci4g4BScd4qY5acQpUE1sK0Nn0vH5EDpBcmp2Drt76txV8dcM4IQKMzpNoKLhFWH
         UviQ==
X-Gm-Message-State: AFqh2kphzUxRHQwozF2+OAbjnii3loETruY530r4R0+j9cMQ/IF6SZmq
        oP4ifODqbCn770dIGXnHi10=
X-Google-Smtp-Source: AMrXdXv/i9dJqSDbNXzw+daBW5ItM89T3EH1o2eCjRXa1NcdhmjS8GEEjrDIBWC6CrD8BG+O+Hs/kA==
X-Received: by 2002:a05:6a20:289f:b0:a7:8b5e:af77 with SMTP id q31-20020a056a20289f00b000a78b5eaf77mr57960590pzf.36.1672962374811;
        Thu, 05 Jan 2023 15:46:14 -0800 (PST)
Received: from [10.1.1.24] (122-62-142-61-fibre.sparkbb.co.nz. [122.62.142.61])
        by smtp.gmail.com with ESMTPSA id l10-20020a63f30a000000b00496317241f9sm21364289pgh.51.2023.01.05.15.46.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jan 2023 15:46:14 -0800 (PST)
Subject: Re: [syzbot] [hfs?] WARNING in hfs_write_inode
To:     Linus Torvalds <torvalds@linux-foundation.org>
References: <000000000000dbce4e05f170f289@google.com>
 <5f45bb9a-5e00-48dd-82b0-46b19b1b98a3@app.fastmail.com>
 <CAHk-=wi8XyAUF9_z6-oa4Ava6PVZeE-=TVNcFK1puQHpOtqLLw@mail.gmail.com>
 <ab7a9477-ddc7-430f-b4ee-c67251e879b0@app.fastmail.com>
 <1bd49fc0-d64f-4eb8-841a-4b09e178b5fd@gmail.com>
 <CAHk-=wg3U3Y6eaura=xQzTsktpEOMETYYnue+_KSbQmpg7vZ0Q@mail.gmail.com>
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
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1a3d07bf-16f5-71a8-6500-7d37802dbadd@gmail.com>
Date:   Fri, 6 Jan 2023 12:46:04 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg3U3Y6eaura=xQzTsktpEOMETYYnue+_KSbQmpg7vZ0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Am 06.01.2023 um 10:53 schrieb Linus Torvalds:
> On Thu, Jan 5, 2023 at 1:35 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>> Looking at Linus' patch, I wonder whether the missing fd.entrylength
>> size test in the HFS_IS_RSRC(inode) case was due to the fact that a
>> file's resource fork may be empty?
>
> But if that is the case, then the subsequent hfs_bnode_read would
> return garbage, no? And then writing it back after the update would be
> even worse.
>
> So adding that
>
> +               if (fd.entrylength < sizeof(struct hfs_cat_file))
> +                       goto out;
>
> would seem to be the right thing anyway. No?

Yes, it would seem to be the right thing (in order to avoid further 
corrupting HFS data structures). Returning -EIO might cause a regression 
though.

> But I really don't know the code, so this is all from just looking at
> it and going "that makes no sense". Maybe it _does_ make sense to
> people who have more background on it.

What had me wondering is that the 'panic?' comment was only present in 
the directory and regular file data cased but not in the resource fork 
case.

But I don't really understand the code too well either. I'll have to see 
for myself whether or not your patch does cause a regression on HFS 
filesystems such as the OF bootstrap partition used on PowerPC Macs.

Cheers,

	Michael


>
>              Linus
>
