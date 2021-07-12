Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635A7C07E99
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 19:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47A4361158
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 19:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236219AbhGLTPm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jul 2021 15:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbhGLTPk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jul 2021 15:15:40 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814F8C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jul 2021 12:12:51 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id bt15so5603546pjb.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jul 2021 12:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=D1rTih4AsbAvlmQNd3ehDrBjhHlonSr2Hs1wanRDlAs=;
        b=BN50RP5WPCgXsxqDUR2bU9wLycOzp8K8vUrOSGB1qDhnJEbo15JGw7zDnff30W1g0L
         ehk+jOQllXWLh+LjX0Fb5597j4pjFh2NH0/ceauqjo1KhQ729/ht2S7ziuDuQ6Gg6OBG
         CrSI9G4BwklGRpikwZ/NTKj+Tx8IPFkfSt8oRiDi8KZddOkbxvitUIQyaEcbolKDGSIx
         eAELnzFBu/aYCfbWQsPSagFZUouM8zfd3uYGpiNOT8cdieNurnDQKPhl8L+TXMnnGl+I
         PQxz5GpaGAVIFAO3fLW8p4OiOAn0gmqN4xNpCD6jBfgm94yWymNVtFVddiyEUJFzhfHo
         fvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=D1rTih4AsbAvlmQNd3ehDrBjhHlonSr2Hs1wanRDlAs=;
        b=YpMS2U0H/G2is/h2T9TOWlhd0tDOmGHIhutK9By/8eUIUKPmyQTKYKHO/X2cABGO2W
         CoCyCubOA5gsKiXNGVzB2sP8Pw58CGutEc6NHyeGrSJBTgEiOeNvlT30DKNiP4yh12L6
         yi+HKaJnMm66fkRd6AVwdwtDOFwBX924LsxrWlaDCJhwUMWtTmIcL2gUIV9j7ELWLefY
         6AftEUq93bojFRrN6S4AimuXgLosl/BoAB7FH5i5SRY21L0rnC6Lm2ROgxF26yn4jX92
         ybsAg0EBf94xEr4CaTcS4hbmekHnyEIvgvjQ4sje3cejiwH/QEGKR/43WmQ+dGx92Q1Q
         XhBQ==
X-Gm-Message-State: AOAM531o3huixAKKplHJKsbuQVv94utv9c1HzHlq1oIsQyFnQux79DDy
        7S0fLEDPmEFFqpNSQWk55BbDpLF+uG0=
X-Google-Smtp-Source: ABdhPJydn7P3c1PcLfAcwzqqpLViPLzOdBIpJMNZyAXUeA05NfeDqbPS1CYh502fuOE/kkh3bTS2Hw==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id d18mr15587332pjw.102.1626117170781;
        Mon, 12 Jul 2021 12:12:50 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:c0e7:435e:1bae:e7d? ([2001:df0:0:200c:c0e7:435e:1bae:e7d])
        by smtp.gmail.com with ESMTPSA id b3sm16963139pfi.179.2021.07.12.12.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 12:12:50 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
Date:   Tue, 13 Jul 2021 07:12:45 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87fswjomtm.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 12/07/21 10:20 pm, Andreas Schwab wrote:
> On Jul 11 2021, Michael Schmitz wrote:
>
>> Testing your series, I've got this in the console log:
>>
>> [16534.130000] *** FORMAT ERROR ***   FORMAT=0
>> [16534.150000] Current process id is 1347
>> [16534.160000] BAD KERNEL TRAP: 00000000
>> [16534.180000] Modules linked in: atari_scsi ne 8390p
>> [16534.210000] PC: [<00002a8c>] resume_userspace+0x14/0x16
>> [16534.230000] SR: 2200  SP: d1b6e0e8  a2: 00000000
>> [16534.240000] d0: 0000001e    d1: 00000003    d2: 00000578    d3: 00000000
>> [16534.270000] d4: ffffffff    d5: 00000001    a0: 00000578    a1: 00000080
>> [16534.300000] Process savelog (pid: 1347, task=e3955528)
>> [16534.310000] Frame format=0
>> [16534.330000] Stack from 005e9fa4:
>> [16534.330000]         02108005 0d06b008 1eeeb649 007e0001 00aea040
>> 003ec318 005e9e68 000279a2
>> [16534.330000]         000b0000 00000000 00000000 030dfffb 0044fffa
>> 0e000000 fffa1a00 fffa1c00
>> [16534.330000]         fffa1e00 fffb0e40 fffb0e80 00049e02 00000040
>> 0085a800 00000001
>> [16534.430000] Call Trace: [<000279a2>] warn_slowpath_fmt+0x0/0x62
>> [16534.460000]  [<000b0000>] vm_map_ram+0x144/0x5ae
>> [16534.490000]  [<00049e02>] __handle_irq_event_percpu+0x38/0xce
>> [16534.520000]
>> [16534.540000] Code: 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 <9f38> 9f38
>> 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38
> That looks like something overwrote the kernel code. 0x9f38 isn't an
> insn that you would ever see in the kernel.

That confirms my guess - can we rely on the call trace in that case? And 
how does overwriting kernel code at that address tee up with the kernel 
still happily chugging along?

Cheers,

     Michael


>
> Andreas.
>
