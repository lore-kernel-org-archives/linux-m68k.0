Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649C7C001B0
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 03:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbjHODF7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Aug 2023 23:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjHODFZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Aug 2023 23:05:25 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6C0170F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 20:05:23 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52564f3faf7so2199636a12.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Aug 2023 20:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692068721; x=1692673521;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWfburCHtpYJpWSDQtyZ0qejRqFCa8YZyYbU9Ud4y9Q=;
        b=HGLR+fZFz+tF0LnD1sTCKwQEYToBPj6N4x948rh1J76ZnWy/634SIychHhiFzdvM3g
         P5GXge+DL/RVej7Z0oXZcJLeGwqjqi08S/FjoIVV2WDyk+C5vV49RY7DyYPTvOkmKGO3
         7oyQME2JQXPtoGQyWEEW8EGyHcOGaVHkUPSnbZ9OFyz/EMSXSWoGQUx5XMejltx3MfCu
         3OmZLjx+aS2FqMPK2rmxsbS9r+KhPSb4a2tkalINrMkvjgndiZWMFEiTF4F9RJfROrpB
         1GYJtw3XrcXSYREBgvgXdAdaFYyMK9upAMMVn6j7kzhsLnlpWPgRpacrIah7Uq47P7ez
         zpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692068721; x=1692673521;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWfburCHtpYJpWSDQtyZ0qejRqFCa8YZyYbU9Ud4y9Q=;
        b=SZ9uaGxgDSN/t2WlCyMgHGcI1MMTFzh0YjdGaNJOZVS6ZMMRs2eU//+AO4L0hcg2hn
         OcKNxI8RlT3PClc20JILWdWGb1/ux844z0sepkghT2+jOOCxG3cPm4Raf7d3HpiWr6ff
         Hgz526Ca/5lXtGhkJVHj6fZ6ouvlDTAR+XOv71OcWzVFI/jDSd3ggOGyUrvjms6qnvw8
         SeYS7YwiIxXLW+jzN4aqLJfXU9f+wDcDCbUAWggsuxG4ic4PPLkUEv+cj8Z7b+v9UOoC
         3fhp/dELqb8bq5+6v69IbJ13P7L4TZdHH7hndGndDWxhm8Z2eyLw3i5s0JIroSSTHkB6
         IolQ==
X-Gm-Message-State: AOJu0Yy34f4pgGQ61Hl9QvQa5GwTcs/29Hsslc1jVexrQpD9kMniJ2lR
        b23JSNZx/vEXkGq5pbEpqUw=
X-Google-Smtp-Source: AGHT+IGLYzObGTB9gS0p4NKy4G3r09GVwYemNfq89wAJKRd7ayop5RdBv4iW0DBE6fdJepYhBceqBw==
X-Received: by 2002:aa7:c0cc:0:b0:523:100b:462b with SMTP id j12-20020aa7c0cc000000b00523100b462bmr9282530edp.5.1692068721385;
        Mon, 14 Aug 2023 20:05:21 -0700 (PDT)
Received: from ?IPv6:::1? ([2a02:3038:205:fb74:4651:e573:5ba9:fd3])
        by smtp.gmail.com with ESMTPSA id d22-20020a056402079600b0052569cb790bsm1585298edy.89.2023.08.14.20.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 20:05:20 -0700 (PDT)
Sender: "Richard Z." <richard.zz.ba@gmail.com>
Date:   Tue, 15 Aug 2023 03:05:18 +0000
From:   Richard Z <rz@linux-m68k.org>
To:     Finn Thain <fthain@linux-m68k.org>
CC:     Michael Schmitz <schmitzmic@gmail.com>,
        William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
In-Reply-To: <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org>
References: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com> <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com> <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com> <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org> <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com> <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org> <ZNlYFCVubNgzmUfc@sowerbutts.com> <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com> <ZNoNlC5fhztMFBAk@sowerbutts.com> <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com> <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org> <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org>
Message-ID: <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On August 14, 2023 11:31:36 PM UTC, Finn Thain <fthain@linux-m68k=2Eorg> w=
rote:
>
>On Mon, 14 Aug 2023, Richard Z wrote:
>
>>=20
>> Well ideally it would be a per-device option=2E This would help the ide=
 SD=20
>> cards greatly and people could byte swap their devices one at a time=2E
>>=20
>
>Would a byte-swapping IDE cable help, e=2Eg=2E if the same flash memory c=
ard=20
>was moved from an IDE interface to a SCSI interface (on the same Q40)?

The Q40 doesn't have SCSI=2E The only issue is exchanging devices with oth=
er computers=2E

Byteswapping cable would help the performance but will also swap the ide i=
dent string so the kernel must take that into account=2E

>
>Perhaps we should not worry too much about unusual use-cases during what=
=20
>would be a temporary transition period=2E=2E=2E


You are right, there are sure many other ways to solve the issue with SD c=
ards=2E

>> Think of it, if you want to boot an older kernel you don't want to=20
>> byteswap your whole hard disk back and forth every time when testing an=
=20
>> older or newer kernel=2E
>
>Probably not an issue for end-users, as they are more likely to boot an=
=20
>old userland together with an old kernel=2E But potentially an issue for=
=20
>kernel developers who need to mix new kernels with old userland=2E Howeve=
r,=20
>kernel developers can use out-of-tree code to help with their testing, as=
=20
>usual=2E

Just don't think this transition is worth it if it will make everything mo=
re complicated and noticeably slower=2E=20

Richard
