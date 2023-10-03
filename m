Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F22FE7AD7E
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Oct 2023 16:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240545AbjJCQzj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Oct 2023 12:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240536AbjJCQzg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Oct 2023 12:55:36 -0400
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4778FB
        for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Oct 2023 09:55:29 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 66DFB2B0020A;
        Tue,  3 Oct 2023 12:55:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 03 Oct 2023 12:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1696352123; x=1696359323; bh=bM
        N3ahYNWDfnd39aNSh3WGWAh25s8Cnm4TD3ZVFC+Qc=; b=srXfPsAwKo7LL9NfzZ
        ZItCto4wxQFdX2Ds/QUIfXcIE68COCFLlMXykreKXi75ko4ATOQbJvAGslC8kSuZ
        wNtj+47ZX6iCzbpT1jEuOXWHD5ZyBGvYKs+pUETvCJ12NkEnZHiweqIjRI/yWhc4
        ljwntdK0mND7A0Gn/3Kr9JCfJNZ7rf9F0CsEXEY1SoniFgkPLZD+FrezdVP+3dDZ
        YdgCxQKY8bSbX6+YutOAJhlELThomcIbwa/alKeicNv4Wq/40uqjQlOx89o6mYX3
        OFOWaLXQExfvNxdFGryYmNJ+5/4yKUy33Vsz/t+SC68okj9ywHR1yme0w/ZQ3NV0
        a3eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1696352123; x=1696359323; bh=bMN3ahYNWDfnd
        39aNSh3WGWAh25s8Cnm4TD3ZVFC+Qc=; b=EcUcSEYhWMQwyrhir+g5g31Hgm39M
        EWL5N9E+aQSymOo0iJYm4k87C7EHcOKm4X0omB5xbtPFD+TX575loxNOIqJUOh9e
        qI0jdEqmGjyZmbUF0LagoGQAe2phUR+4BpXikHJ6Emd8nLjqKisBsNo2lVR3IIiG
        r6BoDO4JV+BIxq02KEwDaj8OqpfPhPpVQB5Vc2EJEcjsVRqVRKwYXurljWVWHgoz
        DCuFq+Os6TmEtMV18PFTi15Zso9YytX7/ZjKbu1QnVAPti01It3iIOyQ7K8aiB59
        oAUwH8ZTZHa01rpn6ANpn/SsKh2cmMiED/QK5nDTh6LKCYWxdMS74zwEg==
X-ME-Sender: <xms:eUccZb5jpCQ1L_VpEXS5ffys7UxBL4kr8p_8cxQFdFQzA4W3bfYYug>
    <xme:eUccZQ5IuUrlgYNty4cvwj_liKVUdhmTFjrzWMhhA-4hKFU9WkVrNtm4G3JcCCE4J
    TABzdnOVnI8NnaEhXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeejgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:eUccZSea6M-vbkLWtRlxBrICjW4w3maEXJlLBg6BGEg3iRNBOmQH5g>
    <xmx:eUccZcIYYLMtmvgNXBhbyezZbbau0FaCohP0oM2XsGnvgv9bQ5csoA>
    <xmx:eUccZfKaRAEmGGd6jK5cgyNwVkQ4mbICOjMLM_AmPXyMEvFnrCgzKg>
    <xmx:e0ccZZRPPQXF-lklqyo6OsUpfMBJpzzJniuMs7wduw3grDX6cmvMcz1mfdA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 48524B60089; Tue,  3 Oct 2023 12:55:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <231994b0-ca11-4347-8d93-ce66fdbe3d25@app.fastmail.com>
In-Reply-To: <487836fc-7c9f-2662-66a4-fa5e3829cf6b@intel.com>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
 <487836fc-7c9f-2662-66a4-fa5e3829cf6b@intel.com>
Date:   Tue, 03 Oct 2023 18:54:59 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Sohil Mehta" <sohil.mehta@intel.com>, linux-api@vger.kernel.org,
        Linux-Arch <linux-arch@vger.kernel.org>
Cc:     "Richard Henderson" <richard.henderson@linaro.org>,
        "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
        "Matt Turner" <mattst88@gmail.com>,
        "Russell King" <linux@armlinux.org.uk>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "Michal Simek" <monstr@monstr.eu>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Helge Deller" <deller@gmx.de>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Nicholas Piggin" <npiggin@gmail.com>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        "Heiko Carstens" <hca@linux.ibm.com>,
        "Vasily Gorbik" <gor@linux.ibm.com>,
        "Alexander Gordeev" <agordeev@linux.ibm.com>,
        "Christian Borntraeger" <borntraeger@linux.ibm.com>,
        "Sven Schnelle" <svens@linux.ibm.com>,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>,
        "Rich Felker" <dalias@libc.org>,
        "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        "Andy Lutomirski" <luto@kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
        "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Chris Zankel" <chris@zankel.net>,
        "Max Filippov" <jcmvbkbc@gmail.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
        "Jiri Olsa" <jolsa@kernel.org>,
        "Namhyung Kim" <namhyung@kernel.org>,
        "Ian Rogers" <irogers@google.com>,
        "Adrian Hunter" <adrian.hunter@intel.com>,
        "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
        "Sergei Trofimovich" <slyich@gmail.com>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Rohan McLure" <rmclure@linux.ibm.com>,
        "Andreas Schwab" <schwab@linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "Brian Gerst" <brgerst@gmail.com>,
        "Randy Dunlap" <rdunlap@infradead.org>,
        "Rick Edgecombe" <rick.p.edgecombe@intel.com>,
        "Mark Brown" <broonie@kernel.org>,
        "Deepak Gupta" <debug@rivosinc.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for all
 architectures
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 3, 2023, at 18:35, Sohil Mehta wrote:
> On 9/14/2023 11:58 AM, Sohil Mehta wrote:
>> commit c35559f94ebc ("x86/shstk: Introduce map_shadow_stack syscall")
>> recently added support for map_shadow_stack() but it is limited to x86
>> only for now. There is a possibility that other architectures (namely,
>> arm64 and RISC-V), that are implementing equivalent support for shadow
>> stacks, might need to add support for it.
>> 
>> Independent of that, reserving arch-specific syscall numbers in the
>> syscall tables of all architectures is good practice and would help
>> avoid future conflicts. map_shadow_stack() is marked as a conditional
>> syscall in sys_ni.c. Adding it to the syscall tables of other
>> architectures is harmless and would return ENOSYS when exercised.
>> 
>> Note, map_shadow_stack() was assigned #453 during the merge process
>> since #452 was taken by fchmodat2().
>> 
>> For Powerpc, map it to sys_ni_syscall() as is the norm for Powerpc
>> syscall tables.
>> 
>> For Alpha, map_shadow_stack() takes up #563 as Alpha still diverges from
>> the common syscall numbering system in the other architectures.
>> 
>> Link: https://lore.kernel.org/lkml/20230515212255.GA562920@debug.ba.rivosinc.com/
>> Link: https://lore.kernel.org/lkml/b402b80b-a7c6-4ef0-b977-c0f5f582b78a@sirena.org.uk/
>> 
>> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
>> ---
>
> Gentle ping...
>
> Are there any additional comments? It applies cleanly on 6.6-rc4.
>
> Or does it seem ready to be merged? It has the following
> acknowledgements until now:
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

If you like, I can pick this up for 6.7 through the asm-generic
tree. If you think this should be part of 6.6, I would suggest
to merge it through the tree that originally contained the
syscall code.

      Arnd
