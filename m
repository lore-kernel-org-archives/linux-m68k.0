Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB82C77B73
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 01:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbjDUBgA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 21:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjDUBf7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 21:35:59 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EF63AAE
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 18:35:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 4A6CD320092B;
        Thu, 20 Apr 2023 21:35:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Apr 2023 21:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682040955; x=1682127355; bh=uGdj1UYI4dlQn
        04EtCbfUqSNb/bFXlTKCNKkF9JCwWo=; b=asIKX7kBUl4GRjDc9ikMGObIJ3SNw
        VOVpFxZY2vXJiUkjVNU1qqocAEi2U3u5p0alCzlSeUSgkD1BX/bE9de27fc3uz1I
        UX2Y5cCuNTBPKa8Gtw7Mi0+dv8KfObmt0zuN85qxdxdDF2bcLYY7NUu4/5Nu0uKL
        wYlZc9M8dBL1UL0oINg5H+n3oleKikzTz37H7YdmFiBgKS0VGjCXNrT817jsWVsu
        DtkL7QcQ5U/7DTDdwqzpUq+KHIKoAvZFPAca5UIlOwQnuWeAIcSJXjeeqn/dQ+20
        aDVaXFVW9FSFTfNN0zNmAPKyuIthH41IKp6P+m78WVfqTUtvRH2Z4nlWw==
X-ME-Sender: <xms:e-hBZAVxhumXfvaW5ojV9cqrukfjGarHC0Y7k-BxelXxxhwJ7gaxSA>
    <xme:e-hBZEm5WgZzCYiZtViC3YvZ1UsFFCHA7la99SFzhNNqwZGlM0scSWhTHOMGiRwaV
    UYZ-6UEIUs1Sz0OYhM>
X-ME-Received: <xmr:e-hBZEbSxEuNjOIREPJ3MmtjOUf-KioamARlJGokLnWWpnrocIoxvCH23ZUZTuQjSe93OtTqQCrqjrsKEWeADQycZZH2oqXYr8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtfedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:e-hBZPXXI-m6s8OjyL11XZC_nFkM4gtBy94-aZlw03kYc2oHa0AtkQ>
    <xmx:e-hBZKnVaEA_t6jqXsjsrmA-QVMEwMswuih8YJb8t88tG3QzdI5HFg>
    <xmx:e-hBZEdrS6PrJSjVrhmxF8_NJIch6AEWR7AmMweQ5vstOgEFj0JNJA>
    <xmx:e-hBZBuyYwm2YYP_r2_0WgNGJwtDLCkc6b7w0jQMOo5vNYKhCC4djA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 21:35:52 -0400 (EDT)
Date:   Fri, 21 Apr 2023 11:39:28 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: reliable reproducer, was Re: core dump analysis
In-Reply-To: <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
Message-ID: <f7eaa957-7005-4327-3bf4-a583abf29f10@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com> <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org> <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com> <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org> <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org> <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com> <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 20 Apr 2023, Finn Thain wrote:

> 
> I modified the test program to execute rec() to full depth with no 
> forking, then do it again with forking.
> 
> root@(none):/root# while ./stack-test 5000 ; do : ; done
> starting recursion
> done.
> starting recursion with fork
> done.
> starting recursion
> done.
> starting recursion with fork
> Illegal instruction
> root@(none):/root# 
> 
> I can't get this to crash during the first descent. The second descent 
> always crashes, given sufficient depth:
> 
> root@(none):/root# while ./stack-test 50000 ; do : ; done
> starting recursion
> done.
> starting recursion with fork
> Illegal instruction
> 
> So all the stack pages would have been faulted in well before the 
> failure shows up. It appears to be the signal that's the problem and not 
> the page fault. 

Sorry, I was mistaken when I infered the absence of bus errors. I should 
have enabled ignore_loglevel and checked the printk output from my patched 
bus_error030():

# ./stack-test 5000
[   47.430000] bus_error030: page fault: pc 80000642, addr 80072fe0
[   47.440000] bus_error030: descriptor address 005a3dc8, contents 00000000
[   47.460000] bus_error030: page fault: pc 8000064a, addr 8006ddc8
[   47.470000] bus_error030: descriptor address 005a3db4, contents 011b300d
[   47.750000] bus_error030: page fault: pc 8001a952, addr 80073068
[   47.760000] bus_error030: descriptor address 005a3dcc, contents 00000000
[   47.790000] bus_error030: page fault: pc 8001a99c, addr 8006fb14
[   47.800000] bus_error030: descriptor address 005a3dbc, contents 011b800d
[   47.880000] bus_error030: page fault: pc 80013e9e, addr 800744e0
[   47.890000] bus_error030: descriptor address 005a3dd0, contents 00000000
[   48.150000] bus_error030: page fault: pc 80038d14, addr efffee38
[   48.160000] bus_error030: descriptor address 005a3bf8, contents 00000000
[   48.600000] bus_error030: page fault: pc 80011d08, addr 80075adc
[   48.620000] bus_error030: descriptor address 005a3dd4, contents 00000000
starting recursion
[   48.650000] bus_error030: page fault: pc 8000038c, addr efffdffc
[   48.660000] bus_error030: descriptor address 005a3bf4, contents 00000000
[   48.670000] bus_error030: page fault: pc 8000038c, addr efffcffc
[   48.690000] bus_error030: descriptor address 005a3bf0, contents 00000000
[   48.710000] bus_error030: page fault: pc 8000038c, addr efffbffc
[   48.720000] bus_error030: descriptor address 005a3bec, contents 00000000
[   48.730000] bus_error030: page fault: pc 8000038c, addr efffaffc
[   48.760000] bus_error030: descriptor address 005a3be8, contents 00000000
[   48.770000] bus_error030: page fault: pc 8000038c, addr efff9ffc
[   48.780000] bus_error030: descriptor address 005a3be4, contents 00000000
[   48.790000] bus_error030: page fault: pc 80000388, addr efff8ffc
[   48.820000] bus_error030: descriptor address 005a3be0, contents 00000000
[   48.830000] bus_error030: page fault: pc 8000038c, addr efff7ffc
[   48.840000] bus_error030: descriptor address 005a3bdc, contents 00000000
[   48.850000] bus_error030: page fault: pc 8000038c, addr efff6ffc
[   48.880000] bus_error030: descriptor address 005a3bd8, contents 00000000
[   48.890000] bus_error030: page fault: pc 8000038c, addr efff5ffc
[   48.900000] bus_error030: descriptor address 005a3bd4, contents 00000000
[   48.920000] bus_error030: page fault: pc 8000038c, addr efff4ffc
[   48.930000] bus_error030: descriptor address 005a3bd0, contents 00000000
[   48.940000] bus_error030: page fault: pc 8000038c, addr efff3ffc
[   48.950000] bus_error030: descriptor address 005a3bcc, contents 00000000
[   48.970000] bus_error030: page fault: pc 8000038c, addr efff2ffc
[   48.980000] bus_error030: descriptor address 005a3bc8, contents 00000000
[   48.990000] bus_error030: page fault: pc 8000038c, addr efff1ffc
[   49.000000] bus_error030: descriptor address 005a3bc4, contents 00000000
[   49.020000] bus_error030: page fault: pc 8000038c, addr efff0ffc
[   49.030000] bus_error030: descriptor address 005a3bc0, contents 00000000
[   49.040000] bus_error030: page fault: pc 80000388, addr effefffc
[   49.050000] bus_error030: descriptor address 005a3bbc, contents 00000000
[   49.070000] bus_error030: page fault: pc 8000038c, addr effeeffc
[   49.080000] bus_error030: descriptor address 005a3bb8, contents 00000000
[   49.090000] bus_error030: page fault: pc 8000038c, addr effedffc
[   49.100000] bus_error030: descriptor address 005a3bb4, contents 00000000
[   49.120000] bus_error030: page fault: pc 8000038c, addr effecffc
[   49.130000] bus_error030: descriptor address 005a3bb0, contents 00000000
[   49.140000] bus_error030: page fault: pc 8000038c, addr effebffc
[   49.150000] bus_error030: descriptor address 005a3bac, contents 00000000
[   49.170000] bus_error030: page fault: pc 8000038c, addr effeaffc
[   49.180000] bus_error030: descriptor address 005a3ba8, contents 00000000
[   49.190000] bus_error030: page fault: pc 8000038c, addr effe9ffc
[   49.200000] bus_error030: descriptor address 005a3ba4, contents 00000000
[   49.220000] bus_error030: page fault: pc 8000038c, addr effe8ffc
[   49.230000] bus_error030: descriptor address 005a3ba0, contents 00000000
[   49.240000] bus_error030: page fault: pc 8000038c, addr effe7ffc
[   49.250000] bus_error030: descriptor address 005a3b9c, contents 00000000
[   49.270000] bus_error030: page fault: pc 80000388, addr effe6ffc
[   49.280000] bus_error030: descriptor address 005a3b98, contents 00000000
[   49.290000] bus_error030: page fault: pc 8000038c, addr effe5ffc
[   49.300000] bus_error030: descriptor address 005a3b94, contents 00000000
[   49.320000] bus_error030: page fault: pc 8000038c, addr effe4ffc
[   49.330000] bus_error030: descriptor address 005a3b90, contents 00000000
[   49.340000] bus_error030: page fault: pc 8000038c, addr effe3ffc
[   49.360000] bus_error030: descriptor address 005a3b8c, contents 00000000
[   49.380000] bus_error030: page fault: pc 8000038c, addr effe2ffc
[   49.390000] bus_error030: descriptor address 005a3b88, contents 00000000
[   49.400000] bus_error030: page fault: pc 8000038c, addr effe1ffc
[   49.420000] bus_error030: descriptor address 005a3b84, contents 00000000
[   49.440000] bus_error030: page fault: pc 8000038c, addr effe0ffc
[   49.450000] bus_error030: descriptor address 005a3b80, contents 00000000
[   49.460000] bus_error030: page fault: pc 8000038c, addr effdfffc
[   49.490000] bus_error030: descriptor address 005a3b7c, contents 00000000
[   49.500000] bus_error030: page fault: pc 8000038c, addr effdeffc
[   49.510000] bus_error030: descriptor address 005a3b78, contents 00000000
[   49.530000] bus_error030: page fault: pc 80000388, addr effddffc
[   49.540000] bus_error030: descriptor address 005a3b74, contents 00000000
[   49.550000] bus_error030: page fault: pc 8000038c, addr effdcffc
[   49.560000] bus_error030: descriptor address 005a3b70, contents 00000000
[   49.580000] bus_error030: page fault: pc 8000038c, addr effdbffc
[   49.590000] bus_error030: descriptor address 005a3b6c, contents 00000000
[   49.600000] bus_error030: page fault: pc 8000038c, addr effdaffc
[   49.610000] bus_error030: descriptor address 005a3b68, contents 00000000
[   49.630000] bus_error030: page fault: pc 8000038c, addr effd9ffc
[   49.640000] bus_error030: descriptor address 005a3b64, contents 00000000
[   49.650000] bus_error030: page fault: pc 8000038c, addr effd8ffc
[   49.680000] bus_error030: descriptor address 005a3b60, contents 00000000
[   49.690000] bus_error030: page fault: pc 8000038c, addr effd7ffc
[   49.700000] bus_error030: descriptor address 005a3b5c, contents 00000000
[   49.720000] bus_error030: page fault: pc 8000038c, addr effd6ffc
[   49.730000] bus_error030: descriptor address 005a3b58, contents 00000000
[   49.740000] bus_error030: page fault: pc 8000038c, addr effd5ffc
[   49.750000] bus_error030: descriptor address 005a3b54, contents 00000000
[   49.770000] bus_error030: page fault: pc 80000388, addr effd4ffc
[   49.780000] bus_error030: descriptor address 005a3b50, contents 00000000
[   49.800000] bus_error030: page fault: pc 8000038c, addr effd3ffc
[   49.820000] bus_error030: descriptor address 005a3b4c, contents 00000000
done.
starting recursion with fork
[   49.910000] bus_error030: page fault: pc 8001599c, addr efff7d3c
[   49.930000] bus_error030: descriptor address 005a3bdc, contents 0182e01d
[   49.940000] bus_error030: page fault: pc 80000b3c, addr efff7d24
[   49.970000] bus_error030: descriptor address 014280dc, contents 0182e01d
[   49.980000] bus_error030: page fault: pc 800003ea, addr 800703a0
[   49.990000] bus_error030: descriptor address 005a3dc0, contents 011aa01d
[   50.000000] bus_error030: page fault: pc 80015730, addr 800731d0
[   50.030000] bus_error030: descriptor address 005a3fcc, contents 0132201d
[   50.040000] bus_error030: page fault: pc 8000038c, addr efff6ffc
[   50.050000] bus_error030: descriptor address 005a3bd8, contents 0182f01d
[   50.070000] bus_error030: page fault: pc 8000038c, addr efff5ffc
[   50.080000] bus_error030: descriptor address 005a3bd4, contents 0183001d
[   50.090000] bus_error030: page fault: pc 80015736, addr 8006faf0
[   50.100000] bus_error030: descriptor address 005a3fbc, contents 0132301d
[   50.120000] bus_error030: page fault: pc 8000038c, addr efff4ffc
[   50.130000] bus_error030: descriptor address 005a3bd0, contents 0183101d
[   50.150000] bus_error030: page fault: pc 8000038c, addr efff3ffc
[   50.160000] bus_error030: descriptor address 005a3bcc, contents 0183201d
[   50.190000] bus_error030: page fault: pc 8000038c, addr efff2ffc
[   50.200000] bus_error030: descriptor address 005a3bc8, contents 0183301d
[   50.210000] bus_error030: page fault: pc 8000038c, addr efff1ffc
[   50.240000] bus_error030: descriptor address 005a3bc4, contents 0183401d
[   50.250000] bus_error030: page fault: pc 8000038c, addr efff0ffc
[   50.260000] bus_error030: descriptor address 005a3bc0, contents 0183501d
[   50.270000] bus_error030: page fault: pc 80000388, addr effefffc
[   50.290000] bus_error030: descriptor address 005a3bbc, contents 0183601d
[   50.310000] bus_error030: page fault: pc 8000038c, addr effeeffc
[   50.320000] bus_error030: descriptor address 005a3bb8, contents 0183701d
[   50.330000] bus_error030: page fault: pc 8000038c, addr effedffc
[   50.360000] bus_error030: descriptor address 005a3bb4, contents 0183801d
[   50.370000] bus_error030: page fault: pc 8000038c, addr effecffc
[   50.380000] bus_error030: descriptor address 005a3bb0, contents 0183901d
[   50.390000] bus_error030: page fault: pc 8000038c, addr effebffc
[   50.420000] bus_error030: descriptor address 005a3bac, contents 0183a01d
[   50.430000] bus_error030: page fault: pc 8000038c, addr effeaffc
[   50.440000] bus_error030: descriptor address 005a3ba8, contents 0183b01d
[   50.450000] bus_error030: page fault: pc 8000038c, addr effe9ffc
[   50.480000] bus_error030: descriptor address 005a3ba4, contents 0183c01d
[   50.490000] bus_error030: page fault: pc 8000038c, addr effe8ffc
[   50.500000] bus_error030: descriptor address 005a3ba0, contents 0183d01d
[   50.510000] bus_error030: page fault: pc 8000038c, addr effe7ffc
[   50.530000] bus_error030: descriptor address 005a3b9c, contents 0183e01d
[   50.550000] bus_error030: page fault: pc 80000388, addr effe6ffc
[   50.560000] bus_error030: descriptor address 005a3b98, contents 0183f01d
[   50.570000] bus_error030: page fault: pc 8000038c, addr effe5ffc
[   50.590000] bus_error030: descriptor address 005a3b94, contents 0184001d
[   50.620000] bus_error030: page fault: pc 8001599c, addr effe5d3c
[   50.630000] bus_error030: descriptor address 005a3b94, contents 0184001d
[   50.650000] bus_error030: page fault: pc 80000b3c, addr effe5d24
[   50.660000] bus_error030: descriptor address 01429094, contents 0184001d
[   50.670000] bus_error030: page fault: pc 800003ea, addr 800703a0
[   50.680000] bus_error030: descriptor address 005a3dc0, contents 0185501d
[   50.700000] bus_error030: page fault: pc 80015730, addr 800731d0
[   50.710000] bus_error030: descriptor address 005a3fcc, contents 0132201d
[   50.720000] bus_error030: page fault: pc 8000038c, addr effe4ffc
[   50.730000] bus_error030: descriptor address 005a3b90, contents 0184101d
[   50.750000] bus_error030: page fault: pc 80015736, addr 8006faf0
[   50.760000] bus_error030: descriptor address 005a3fbc, contents 0132301d
[   50.780000] bus_error030: page fault: pc 8000038c, addr effe3ffc
[   50.790000] bus_error030: descriptor address 005a3b8c, contents 0184201d
[   50.820000] bus_error030: page fault: pc 8000038c, addr effe2ffc
[   50.830000] bus_error030: descriptor address 005a3b88, contents 0184301d
[   50.840000] bus_error030: page fault: pc 8000038c, addr effe1ffc
[   50.860000] bus_error030: descriptor address 005a3b84, contents 0184401d
[   50.880000] bus_error030: page fault: pc 8000038c, addr effe0ffc
[   50.890000] bus_error030: descriptor address 005a3b80, contents 0184501d
[   50.900000] bus_error030: page fault: pc 8000038c, addr effdfffc
[   50.920000] bus_error030: descriptor address 005a3b7c, contents 0184601d
[   50.940000] bus_error030: page fault: pc 8000038c, addr effdeffc
[   50.950000] bus_error030: descriptor address 005a3b78, contents 0184701d
[   50.960000] bus_error030: page fault: pc 80000388, addr effddffc
[   50.990000] bus_error030: descriptor address 005a3b74, contents 0184801d
[   51.000000] bus_error030: page fault: pc 8000038c, addr effdcffc
[   51.010000] bus_error030: descriptor address 005a3b70, contents 0184901d
[   51.030000] bus_error030: page fault: pc 8000038c, addr effdbffc
[   51.040000] bus_error030: descriptor address 005a3b6c, contents 0184a01d
[   51.050000] bus_error030: page fault: pc 8000038c, addr effdaffc
[   51.060000] bus_error030: descriptor address 005a3b68, contents 0184b01d
[   51.070000] bus_error030: page fault: pc 8000038c, addr effd9ffc
[   51.100000] bus_error030: descriptor address 005a3b64, contents 0184c01d
[   51.110000] bus_error030: page fault: pc 8000038c, addr effd8ffc
[   51.120000] bus_error030: descriptor address 005a3b60, contents 0184d01d
[   51.130000] bus_error030: page fault: pc 8000038c, addr effd7ffc
[   51.160000] bus_error030: descriptor address 005a3b5c, contents 0184e01d
[   51.170000] bus_error030: page fault: pc 8000038c, addr effd6ffc
[   51.180000] bus_error030: descriptor address 005a3b58, contents 0184f01d
[   51.190000] bus_error030: page fault: pc 8000038c, addr effd5ffc
[   51.220000] bus_error030: descriptor address 005a3b54, contents 0185001d
[   51.230000] bus_error030: page fault: pc 80000388, addr effd4ffc
[   51.240000] bus_error030: descriptor address 005a3b50, contents 0185101d
[   51.260000] bus_error030: page fault: pc 8000038c, addr effd3ffc
[   51.270000] bus_error030: descriptor address 005a3b4c, contents 0185201d
[   51.290000] bus_error030: page fault: pc 8001599c, addr effd3d3c
[   51.300000] bus_error030: descriptor address 005a3b4c, contents 0185201d
[   51.320000] bus_error030: page fault: pc 80000b3c, addr effd3d24
[   51.330000] bus_error030: descriptor address 0142804c, contents 0185201d
[   51.340000] bus_error030: page fault: pc 800003ea, addr 800703a0
[   51.360000] bus_error030: descriptor address 005a3dc0, contents 0185601d
[   51.380000] bus_error030: page fault: pc 80015730, addr 800731d0
[   51.390000] bus_error030: descriptor address 005a3fcc, contents 0132201d
[   51.400000] bus_error030: page fault: pc 80015736, addr 8006faf0
[   51.430000] bus_error030: descriptor address 005a3fbc, contents 0132301d
Illegal instruction
# 


diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index a700807c9b6d..4820d5e7dd8d 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -500,9 +500,7 @@ static inline void bus_error030 (struct frame *fp)
 	unsigned short mmusr;
 	unsigned long addr, errorcode;
 	unsigned short ssw = fp->un.fmtb.ssw;
-#ifdef DEBUG
 	unsigned long desc;
-#endif
 
 	pr_debug("pid = %x  ", current->pid);
 	pr_debug("SSW=%#06x  ", ssw);
@@ -526,25 +524,24 @@ static inline void bus_error030 (struct frame *fp)
 	if (ssw & DF) {
 		addr = fp->un.fmtb.daddr;
 
-#ifdef DEBUG
 		asm volatile ("ptestr %3,%2@,#7,%0\n\t"
 			      "pmove %%psr,%1"
 			      : "=a&" (desc), "=m" (temp)
 			      : "a" (addr), "d" (ssw));
-		pr_debug("mmusr is %#x for addr %#lx in task %p\n",
-			 temp, addr, current);
-		pr_debug("descriptor address is 0x%p, contents %#lx\n",
-			 __va(desc), *(unsigned long *)__va(desc));
-#else
-		asm volatile ("ptestr %2,%1@,#7\n\t"
-			      "pmove %%psr,%0"
-			      : "=m" (temp) : "a" (addr), "d" (ssw));
-#endif
 		mmusr = temp;
 		errorcode = (mmusr & MMU_I) ? 0 : 1;
 		if (!(ssw & RW) || (ssw & RM))
 			errorcode |= 2;
 
+		if ((ssw & RW) == 0) {
+			u16 inst;
+			if (get_user(inst, (u16 *)fp->ptregs.pc) == 0 &&
+			    memcmp(current->comm, "stack-test", 10) == 0) {
+				printk(KERN_DEBUG "%s: page fault: pc %08lx, addr %08lx\n", __func__, fp->ptregs.pc, addr);
+				printk(KERN_DEBUG "%s: descriptor address %08lx, contents %08lx\n", __func__, (unsigned long)__va(desc), *(unsigned long *)__va(desc));
+			}
+		}
+
 		if (mmusr & (MMU_I | MMU_WP)) {
 			/* We might have an exception table for this PC */
 			if (ssw & 4 && !search_exception_tables(fp->ptregs.pc)) {
