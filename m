Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23056C4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Aug 2021 19:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E649261288
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Aug 2021 19:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhHOTRy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 15 Aug 2021 15:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhHOTRx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 15 Aug 2021 15:17:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60A1C061764
        for <linux-m68k@lists.linux-m68k.org>; Sun, 15 Aug 2021 12:17:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so13390623pjb.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 15 Aug 2021 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sIa+g3PF2ykhxv/HXTTU+tkzk0SObMmD0kHeisJ5LAI=;
        b=mUrFYdYYAVuG8dvrBDtlDJPvD1A2bttQ9Gl+3h4QnlvknvlFko+/lkDCEXGjE36t69
         B7f5+CUNTRKAv0Q9ZMFnTxKPgzebjl1Lv1VYIPqiW6YJ6F7dM4PYhalBwrUk//vytqnO
         MNA4dVK4O0pfAtge79O/eSuRshiarWlsx/TBQkQOSOh19idXSI9CiBLYdcNVwm6eH/uE
         14RrzRLtNrSqA/Eyy9EzDjQh6MZNtylCQXAdiVyCmPQZbZ0xx/6DI5+MMzWc5pX2wXfW
         4oGQv1klHk0v8VqCwfJShL1C2kpEVAcPGBEJ+01p4byEDnyuJ8sLpiDCNLxU3K7QnUqt
         1DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sIa+g3PF2ykhxv/HXTTU+tkzk0SObMmD0kHeisJ5LAI=;
        b=crzhM1zBTrEQT8SB33z5F0j9hUa5Lz7hWaNtwSRo1+BtmZLlfmlU3hjlduWLw9tKWo
         0aNQQir1yQY/CzDtHD1Kj1PNYAsLUGTra4uZZoNCQA+8WuL0EcKwtmQX5xQuSncUXJ1k
         a81EhNbWFJ11ys0aTeAmfppnk356rE+U2+CgL9g/1c8Zq+uSvmCexg7FuOBquaErtlo5
         ZpW+7gDpgZ3Ctuf8ACjhIX65iq+TOx0oLD3CKUR7yVa7aE1/cpDQ/han11SECU6iJ+Kw
         Pz2Njq+LqaTS8ZupfIU7m3P7DyxYyt+sdYnUYlFMwqQZOgDtYbyIFSDEPPtn+jYgbahQ
         CCVA==
X-Gm-Message-State: AOAM531AJtXaFgWoYzi9X+xKzgN1bAEbch3sCOnedJ8hknlLHUEF8Fjg
        nHihGf53FFl3X6DltDa7HWI=
X-Google-Smtp-Source: ABdhPJxngRMSc307/syB/b+BF8r4Dx6MbytisVbzIWPrRx6yGob2Bj4pvxqExgPhxLL8cA8fkr+Pgg==
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr13551464pjb.174.1629055041012;
        Sun, 15 Aug 2021 12:17:21 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:e490:6dca:29ba:7b4b? ([2001:df0:0:200c:e490:6dca:29ba:7b4b])
        by smtp.gmail.com with ESMTPSA id y62sm8703674pfg.88.2021.08.15.12.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Aug 2021 12:17:20 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
 <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
 <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210815074236.GA23777@lst.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
Date:   Mon, 16 Aug 2021 07:17:15 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210815074236.GA23777@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 15/08/21 7:42 pm, Christoph Hellwig wrote:
> Hi Michael,
>
> after your last mail I went back and looked very closely at the
> set_fs removal and your debug patches below.  And one hunk stands out:
>
>>   static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>>   {
>> -	if (vma->vm_mm == current->active_mm)
>> +	if (vma->vm_mm == current->active_mm) {
>> +		unsigned long old_fc = force_user_fc_begin();
>>   		__flush_tlb_one(addr);
>> +		force_user_fc_end(old_fc);
>> +	}
> This is the only old user of force_uaccess_begin, and the only one
> where this patch adds back a DFC/SFC access where there was none at
> at all with the set_fs removal.  So I'd be curious if you just add this
> hunk (plus the supporting infrastructure) on top of my tree for now to
> see if there were some side effects of the instructions that were
> important, be that seralization, timing or anything else.

Would it be acceptable to add this on top of the 
probe040/do_040writeback1 patch that I'm currently testing?

Cheers,

     Michael


