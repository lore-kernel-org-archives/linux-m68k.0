Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B57C54E76
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Jan 2023 07:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjAFHJt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 Jan 2023 02:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbjAFHJp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 Jan 2023 02:09:45 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF50972D03
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Jan 2023 23:09:23 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id c4so851103plc.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Jan 2023 23:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysvQ5mWCfecP1pnK0ECpg7dYPVloD8TUDMgLXFROJSc=;
        b=gL/Ugv/ETJll252x/aCu/2kunvNUeFZnkAgSCSQVAMQEQVxrunO9V415PmNHhQtQaZ
         mNUU3l9fAFTjwKCUCIJK/AVf33RiX3pkyXEYhQrXarKFskuG6fULdC5Sz0icHCd+j2E6
         ePemStCfS0nzBC7UCOBnXWOnIPSkyuW7Om0GRoUfHXcHFk4DDu9DSD1A6x5cA1k471o6
         tXwwTA8tWUjCWYHUFX5egyBL53/ElGXhpm5dg5z9fJrWxKrLOcduK+vJqikZwUnRR4M9
         2paxNNieP8A5W1PeqRyQ8l4KmXQKE6DqizUPjjhFR4YV8qTrtke5ug3BfY1zQgDljAd/
         ocCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ysvQ5mWCfecP1pnK0ECpg7dYPVloD8TUDMgLXFROJSc=;
        b=Lfz3VZMQ9szxZVeneKLK0CYWRyuP9tFDcUxiPcwlQ0IJCcc5qiFOxkgXeiNlyPvYf5
         /k5BPX3Lc2V0mVbPugNylTfbHiqhtXkEfrjZqQTiNpvFdLkzgjcUqYB+G1wkzPwZVtcv
         5Z71wx/XMCc1hjd9z6KjnZh6LuF3kmImnylutaogwkZ96iYagB0gqtbr5UsA6wIkovNg
         qXdaRNWym3AJNAdyljpym8EKREkef95qWNBBAOpUBWS35f/LuGnRbzpN5J03NUV7AK1I
         ZMS/Lj0nRBN7gQ7fsnlStOCXlh1WPwANG61AepUMCeXGnU4w7JQSprWsrJhP5fAr19Zy
         zDeg==
X-Gm-Message-State: AFqh2kpJ3tyF82GfpV8xLUeRBxfYmyLWgR+UACTwI/4RmxdB6MYs1KHR
        c0nKedfWJs9Ikbd+4YIbR94=
X-Google-Smtp-Source: AMrXdXv4n1QDuQCdzkPGOBceJ/X94uO2HWAOhcpZV+1FkbXOEddT5oC+zwETTA+hm8DufkBz/iaM9w==
X-Received: by 2002:a17:902:e5c5:b0:189:c57c:9a19 with SMTP id u5-20020a170902e5c500b00189c57c9a19mr73726106plf.58.1672988963276;
        Thu, 05 Jan 2023 23:09:23 -0800 (PST)
Received: from [10.1.1.24] (122-62-142-61-fibre.sparkbb.co.nz. [122.62.142.61])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b0017f48a9e2d6sm113944plh.292.2023.01.05.23.09.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jan 2023 23:09:22 -0800 (PST)
Subject: Re: [syzbot] [hfs?] WARNING in hfs_write_inode
To:     Linus Torvalds <torvalds@linux-foundation.org>
References: <000000000000dbce4e05f170f289@google.com>
 <5f45bb9a-5e00-48dd-82b0-46b19b1b98a3@app.fastmail.com>
 <CAHk-=wi8XyAUF9_z6-oa4Ava6PVZeE-=TVNcFK1puQHpOtqLLw@mail.gmail.com>
 <ab7a9477-ddc7-430f-b4ee-c67251e879b0@app.fastmail.com>
 <1bd49fc0-d64f-4eb8-841a-4b09e178b5fd@gmail.com>
 <CAHk-=wg3U3Y6eaura=xQzTsktpEOMETYYnue+_KSbQmpg7vZ0Q@mail.gmail.com>
 <1a3d07bf-16f5-71a8-6500-7d37802dbadd@gmail.com>
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
Message-ID: <baced5a3-31a3-d104-bf31-87d75fecb8e9@gmail.com>
Date:   Fri, 6 Jan 2023 20:09:11 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1a3d07bf-16f5-71a8-6500-7d37802dbadd@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Am 06.01.2023 um 12:46 schrieb Michael Schmitz:
> Hi Linus,
>
> Am 06.01.2023 um 10:53 schrieb Linus Torvalds:
>> On Thu, Jan 5, 2023 at 1:35 PM Michael Schmitz <schmitzmic@gmail.com>
>> wrote:
>>>
>>> Looking at Linus' patch, I wonder whether the missing fd.entrylength
>>> size test in the HFS_IS_RSRC(inode) case was due to the fact that a
>>> file's resource fork may be empty?
>>
>> But if that is the case, then the subsequent hfs_bnode_read would
>> return garbage, no? And then writing it back after the update would be
>> even worse.
>>
>> So adding that
>>
>> +               if (fd.entrylength < sizeof(struct hfs_cat_file))
>> +                       goto out;
>>
>> would seem to be the right thing anyway. No?
>
> Yes, it would seem to be the right thing (in order to avoid further
> corrupting HFS data structures). Returning -EIO might cause a regression
> though.

A brief test on a HFS filesystem image (copy of my yaboot bootstrap 
partition) did not show any regression, so your patch appears to be just 
fine as-is.

Cheers,

	Michael

