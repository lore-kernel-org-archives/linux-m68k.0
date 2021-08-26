Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C1CC432BE
	for <linux-m68k@archiver.kernel.org>; Thu, 26 Aug 2021 07:47:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A62FF610D1
	for <linux-m68k@archiver.kernel.org>; Thu, 26 Aug 2021 07:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240043AbhHZHsC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 26 Aug 2021 03:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240023AbhHZHsC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 26 Aug 2021 03:48:02 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830C7C061757
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Aug 2021 00:47:15 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id oc2-20020a17090b1c0200b00179e56772d6so5989445pjb.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Aug 2021 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=yi5juBjf9R3hJfqG9UMI8fRDjb8S8GiLrsUX/ETH5iY=;
        b=HE+CPbA62eXAoGExNsbtuQmsBUdr++yhweR7nuemMUeK4s5oUBWfLBKzbVEGXPTxP8
         RCQgIgj83NkCJDYQdTJ/y49n1zix7JnLYSpf6j8HllWw6sdeuhUfRM/erRYmTUu1sna/
         3qYfd47cxzWodSKZDoC64F0QxR3xKNEitLpVb/OPDKS/HiO3oxkKmMYBtEY59Jh79ps1
         COcNMjQXykWLpVQBq1N9Bq1hZqAvVKX3aJaCgGj/SkMQLfRQuT6lrulmnp4am2qm/CvL
         4WWvZqinbNEJ+3qt9wxCoQsvGOcsGLfpAg7Ni50C3aVSUYrrYB1WgBo8G1oKJhbJRV5l
         QBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=yi5juBjf9R3hJfqG9UMI8fRDjb8S8GiLrsUX/ETH5iY=;
        b=T93L4sBMDOo+ObGDQrhO5yQuLB/Tj7Yn2cI5pZGg9NYidE3RpW4G2zNED1THzsm+DN
         a7cuqmgDpVGMQNoWnwgFRBpHIqozXP1le2KPNn7OCPbZ0I/nwYVXvPDStpJ3Ytzh2Z7j
         7nym5UPl7YubuIom6f03jKaUUvUjG+PWfpVfbxJEevZPPb3UilprtMmKpRVPPHJFobKc
         eGO/JNP7kBeYJjqNU/EaDBA7c4PbXEhHvj9Mo76lga/vcE2aOtZqFhoff8ceWdHS/kzF
         Xqs/jSqVAUitmlEzpo0UufRnUXg5wNDXNCp+3B8EcubOHKjx0nNgQztNGawFxzy0qWsq
         onfQ==
X-Gm-Message-State: AOAM533ptTVPclkCpDxx5NcVM7vN587rJEf4S7U+QE7gAb3sE1bkOwrK
        RCgCM+H65nQFYFPkaXUDnFcEeU+bQUo=
X-Google-Smtp-Source: ABdhPJyRsfTylVuIPEvkcZ2dES+a82oP1akfucteFG1rwu7fxdiYIJcfU0gsXpO0jsU+7ENOuPfLow==
X-Received: by 2002:a17:90a:4d8d:: with SMTP id m13mr2811815pjh.190.1629964034710;
        Thu, 26 Aug 2021 00:47:14 -0700 (PDT)
Received: from [10.1.1.26] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id v25sm1884642pfm.202.2021.08.26.00.47.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Aug 2021 00:47:14 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Brad Boyer <flar@allandria.com>
References: <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
 <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
 <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
 <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
 <57501cee-de70-99e5-3a92-e5d2a515bb51@gmail.com> <87bl5n9q1e.fsf@igel.home>
 <208ad46d-e4ef-68e3-97d0-aa7756852a92@gmail.com> <878s0px6al.fsf@igel.home>
 <CAOmrzkLSSUDXrN+NF+bbKNbj_u79ffkCERZ8cZ70=POfLQkM4Q@mail.gmail.com>
 <20210825233054.GA31679@allandria.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <cc89808a-f2e1-a89f-9e5c-4b5df41c2c11@gmail.com>
Date:   Thu, 26 Aug 2021 19:46:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20210825233054.GA31679@allandria.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Brad,

thanks, I can see the tables in that one. My searches only showed the 
newer version which comes in two parts ...

The 'vector offset' 8 in the format/vector field indicates a bus error. 
Not sure that helps pin down the cause without debugging the 030 bus 
error handler. Format b bus faults might be quite frequent ...

Cheers,

     Michael



On 26/08/21 11:30, Brad Boyer wrote:
> On Thu, Aug 26, 2021 at 10:59:30AM +1200, Michael Schmitz wrote:
>> On Wed, Aug 25, 2021 at 8:44 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>> On Aug 25 2021, Michael Schmitz wrote:
>>>
>>>> the manuals on the NXP web site don't have the exception frame format
>>>> tables,
>>> See 8.4 EXCEPTION STACK FRAME FORMATS.
>> Not in my copy of part 2 of the 030 manual. The section is there, the
>> pages that are marked 'Exception Stack Frame format' (pp 8-32, 8-33)
>> are there, but the pages are blank (except for header and footer).
>>
>> Tried with acroread, xpdf and evince.
>>
>> The original Programmer's Reference Manual has the frame formats in
>> section B.2 (without any explanation of the fields' meanings,
>> however).
> It shows up fine for me in the embedded PDF reader in Chrome. There's
> what is clearly a picture of the formats, as the image quality is
> really bad. I can read it, but the lines are kind of jagged and the
> text is pretty messy. Specifically, I'm looking at page 300 (8-33) in
> the PDF found at this URL:
>
> https://www.nxp.com/docs/en/reference-manual/MC68030UM.pdf
>
> Perhaps those other programs aren't handling however that raw image
> is encoded inside the file.
>
> 	Brad Boyer
> 	flar@allandria.com
>

