Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1342C433F5
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Jan 2022 02:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344906AbiA2CIy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Jan 2022 21:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344848AbiA2CIx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Jan 2022 21:08:53 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F586C061714
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jan 2022 18:08:53 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id e16so6827448pgn.4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jan 2022 18:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=T5QP4rvsRHAf+k4UZm2ZD9yCitHTNkLO/bReAgS58JA=;
        b=XAOWparngd+vugNg20ipC1UryGHyoDbb93LFWA3GAFshr/ySrpNgjy0YOa40n9uwOX
         WFvwAfWyH7B9cVgYfjMdVfb3iLcrz8k/YZWWydMwq6lbhcUXm6H7YI2fLqPQzu0LljS0
         HwRJ7P9DlLHm6QhpbU2EHskMMeLlmRBr76/x6yXh9DTtzluYrXFy7PnSX8DNU1CImkL+
         X0htmpI8WoVMCogsmB98RJp1JgZPoTeUo+F3NM3XumyarJwpbqeTiP6vixyLsd/oIMRR
         w+ATpPW1aeFeIBZyNpc6itk7eg8dZVW2MnD2sPCqcLtismpsUxcQUdVBSVcGnZMbSR/U
         o6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=T5QP4rvsRHAf+k4UZm2ZD9yCitHTNkLO/bReAgS58JA=;
        b=mlBVkIYp69tr06FdK+pnaUkXxfdxFF+7nksI09HRlNLdFo5uJRTb3cfbC/nAnFNam0
         T/tkh+Gh7bFbPJkEzrruC6pQjqqxS8QzaUVim4q5bQueeGNRh5gZwEYmzDSv4BBhgYza
         Q3WzyiI4vz89YYo93Kr/EWdGVqgK8FUlC39ZRY/wKK58I/MkPJElQruSVmyPJY/yg03F
         6FD9UCarzJDMQLtS+seiydcnXVV4xNdXrwvFMH+3Qn7VmgETzd6XDLGQ2SzGT71NBX/B
         YQOqWn8XFb15+RZ0RhMZHYJMWePx4QyhW7dAgrcIF0UJMW0BIJjy1lvLGp5p+q3vraFl
         13EQ==
X-Gm-Message-State: AOAM5336q+AoI7hUIqEsJwZfYhwHTZb5F89ZvdTVxiCq2F69Bzrrl5AS
        SgAaEhvaSHnj6J7CYfHHJ9s=
X-Google-Smtp-Source: ABdhPJylW7PZ+KYCbUQHk3BPPrL/0h1TQWt6TeoocnKqbSzNdvVTRyzsyZG6F3MSn8uf/GMqJ2XH/w==
X-Received: by 2002:a63:6586:: with SMTP id z128mr8857019pgb.103.1643422132798;
        Fri, 28 Jan 2022 18:08:52 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id s2sm23087045pgf.56.2022.01.28.18.08.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jan 2022 18:08:52 -0800 (PST)
Subject: Re: [PATCH] m68k: mm: Remove check for VM_IO to fix deferred I/O
To:     Finn Thain <fthain@linux-m68k.org>
References: <20220128173006.1713210-1-geert@linux-m68k.org>
 <b1cd50eb-e476-b4bd-0b2f-b4a8699660f6@gmail.com>
 <4d65d2e1-5fb3-456-3cc5-fbd3167d06c@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2ff869af-87a5-898c-b863-18e48527464b@gmail.com>
Date:   Sat, 29 Jan 2022 15:08:46 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <4d65d2e1-5fb3-456-3cc5-fbd3167d06c@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 29.01.2022 um 12:55 schrieb Finn Thain:
> On Sat, 29 Jan 2022, Michael Schmitz wrote:
>
>> Hi Geert,
>>
>> for hwregs_present(), the exception fixup will handle any access error
>> (through send_fault_sig()), so this should continue to work.
>>
>> Why the special handling of VM_IO pages? Maybe hp300 had marked all IO
>> register pages VM_IO to distinguish IO faults from VM faults...
>>
>> The only other area I can imagine this might have an impact is the Mac's
>> pseudo-DMA - FInn might want to give this some testing.
>>
>
> mac_scsi.c and mac_esp.c don't use ioremap(). They rely on head.S:
>
>         mmu_map_eq      #0x50000000,#0x03000000,%d3
>
> Having said that, I will run some tests if you still think it necessary.

No need for test then, thanks!

Cheers,

	Michael


