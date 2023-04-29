Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67753C77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 07:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjD2HiH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 03:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjD2HiF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Apr 2023 03:38:05 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E749E1FD9
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Apr 2023 00:38:04 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-24dd508237bso216128a91.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Apr 2023 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682753884; x=1685345884;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePKpXr+axtmkCzryd4G1ZMcr+fLXGzs9u0VmDqx3jn0=;
        b=s2F7ytR4qM2KF85ROwSLBMTulpg2eLOAX7W+04EFHQl87PMgvX2uektbXTZnT8HTge
         Q00YVrRdQujKIzmu8KN8LvWA4NR73xxtXyAWC/15muNyJvzwMPQy1Z17WJfeev4Etw9z
         ee/2EDh9xtgTgh1G6OWOKK7kwiXOs2yyhvRwaUDGb8s8XMT7+IxaVVrUHg4SxeEvDVNk
         FwCdh7B/7YIFgn05H3DiKcTy3H2usQtLtTFw0++BazNN3EHGTJiwA1KeoBZMeP3lg2nf
         glsATLUci43cqpfIbBliCdfD3ev2eYpG4i2OATuxxZbyEFmwoOcuvQ7JXdZ/iPluY49h
         ZoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682753884; x=1685345884;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ePKpXr+axtmkCzryd4G1ZMcr+fLXGzs9u0VmDqx3jn0=;
        b=dkct/vXZ6OhdsfgjyP7qN0nr1Z6zkN7TUult01znLLc6r2ro6ibu8W2J+b86MP2Dxr
         2EwjTMJPVre3YVqPeglVKObkT7/609zUTxSK/5ycFLLSuXw0q14MgyqXeWmb9GDwpEMs
         LPAYTD+l17mzxSsvhlu0WaFZiIdXgxM0SIyySKsSeW8Fet86jJ5mePCbpTgnEifn0ffF
         oY9WXo4+92g8B1CB0S6fNZP/bSc3mSCutBBKpN/RsdgiiSoMCPfrWBaehBCY16OHoRRK
         djDlDj7McAUWD6xywJDlmGiGtO3/You8vtV3fECt9BxvkWAMrKBfsamZjCItwLnLUqRQ
         VraA==
X-Gm-Message-State: AC+VfDwZ0QJ2KWZ7jIWjQjOtfAIBa5DH8h7EeUaHHQKXMNMjUszvFEaG
        e8CtCJRc29nE7Q3x38Vharc8ZggxjA8=
X-Google-Smtp-Source: ACHHUZ5JhlzXR+GvNgNKhmdDQjlnI3oPgz4fQP6CfA9CNzqoP0/O0jWXzF7ERD4umiZT+3OV+f0Gyw==
X-Received: by 2002:a17:903:32cd:b0:19f:3d59:e0ac with SMTP id i13-20020a17090332cd00b0019f3d59e0acmr9361089plr.44.1682753883787;
        Sat, 29 Apr 2023 00:38:03 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902ed8c00b001a4ee93efa2sm7584198plj.137.2023.04.29.00.38.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Apr 2023 00:38:03 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
 <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com>
 <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org>
 <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com>
 <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com>
 <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com>
 <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org>
 <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org>
 <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com>
 <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com>
 <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org>
 <13d2b2f4-ad99-02a8-db89-828a4c20fe54@gmail.com>
 <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org>
 <87h6szjh75.fsf@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f840c152-8122-b785-b4ea-316412484472@gmail.com>
Date:   Sat, 29 Apr 2023 19:37:58 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87h6szjh75.fsf@linux-m68k.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 29.04.2023 um 19:11 schrieb Andreas Schwab:
> On Apr 29 2023, Finn Thain wrote:
>
>> There's probably a reason why do_page_fault() picked a 256 byte gap
>
> The biggest size of an operand a (coprocessor) instruction can transfer
> is 255 bytes.

Thanks, that makes more sense now.

Cheers,

	Michael
