Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF22ACA4E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Mar 2024 23:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709766756; cv=none; b=QTNKr6d6DhgVQH+9pqE8fkWEqclQVrh5R62uLA6xhHdrAp5bTgA/VuJ+PnL/u0LSeNyiOKEpEf7k+ptC7BM2O+yvyQnLuIrr5d6w/opC5y4CyoZHgRVJFWXIlo88hLyNs73/qlRlgC/wxJ7WIXDWbAT4tUL3zb1fi+PN14nN0go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709766756; c=relaxed/simple;
	bh=lkPWaO7R8bYsYqFU2kZn8qDX6K5dpdoeNAmjAIGFAY8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u/BvjJeVsb5KQQjit67Y2XHncL+fuk2QSeXHnIEopp43gsufQ9oeVRn/kFZDyt1Yk0TZObc+13kf7cV4BYNwcneUlxGjYoXYofmFTOLy9IJ5+IaUlYaOlNCMSyOlkUKVSnksI7H1cly/5g4rH44MXWGr1O3+8Ls2oEOlU4ehrvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=roE8SpYH; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="roE8SpYH"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 51B121C0008C;
	Wed,  6 Mar 2024 18:12:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 06 Mar 2024 18:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709766751; x=1709853151; bh=Qq/Ue4/GKYF8S3/pn6p3dAoLj/L3
	yXzag9NwuDj8kug=; b=roE8SpYH92sIbj0dwUDX/Tqv5AVtzYEYDMDbTaITODTW
	oDkyG3i8OVErZ7Wk2x2LJDcx3PqAMSYE1uPttftzwQE9q59IAmKoITM8CHXsYirW
	kEtZ4TS4h1neIE2+wGgVZbkWScAzzlVXIM9bjg9QSEaxdu2X5nmlJU5/W3ydnUHx
	ImLxGVPLVPIdUgJzsYBu+AHzP0r9/JLOZFt5jt3s8jWKXXRuLZQSNT/zIdSb2J/v
	3BCpFfyHiJbGvsqQ+iILNRuQ/E6of71yv2Xmg+4hddtd9MGumYHFHsb00SLW8Q3d
	9VUcFmBwxjTYGLNsIJHyWmLFCPcc2fQ9teOCk7CR4A==
X-ME-Sender: <xms:X_joZQ7ljZ8TTpYiYlnngqaAUMuNXxcuFhMDtIX1FRN5czItX67SNw>
    <xme:X_joZR43EwC0GPUWjneDsAHLWWOczWc46RbRHdWDyIJsb2YR2Uwspj_MQqR_IChQD
    T2MCsfjS6QfEWzFgdI>
X-ME-Received: <xmr:X_joZffDuxbb4_hV9WURIUArISFknnP5sZcmVNy5nC_4JHklkXFzbjagy6mu9LG9fD2w1-wuoBETgRzaUUI5Bm2V78DbgPuIKY4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledriedvgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdfgffekudeiffduffdtfeelheehvdeftdduudeggfdtvdfggeethedtveef
    gfeknecuffhomhgrihhnpehnvghsthhinhhgrdgtrghtnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:X_joZVLGmX4W0U3NPhaaGT85jQHe5pOHubOciI3rpIX7k3pO7sXjQQ>
    <xmx:X_joZULhgjvJu1M5V75CAYrbrtU7iY4HAXye5Qfm1XTEInD7Mqts0Q>
    <xmx:X_joZWzR2VIwQ-eY94h8ZVZfkDiFYkhCwst16392T4uG-B-lyhIkZw>
    <xmx:X_joZZGhM6cE-yfotxxrulsEVglD55Vu7bLYQTDLpDiQkLhSDgm-obIYsGI>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Mar 2024 18:12:29 -0500 (EST)
Date: Thu, 7 Mar 2024 10:13:31 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Brad Boyer <flar@allandria.com>
cc: Michael Schmitz <schmitzmic@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <20240306083054.GA20607@allandria.com>
Message-ID: <212aa3c7-0706-f3f6-5bfd-c8146e5192e6@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <20240306083054.GA20607@allandria.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 6 Mar 2024, Brad Boyer wrote:

> It looks like the Q800 supports switching VIA1 to IRQ6 through the
> alternate IRQ mapping. 

Yes, and that's what happens in QEMU. That was easily confirmed with the 
patch below. As a result, you get less clocksource drift during I/O but 
you also get a lot of interrupt nesting.


# cat /proc/interrupts
           CPU0       
  3:          2      auto      sonic
  4:         45      auto      ttyS0
  7:          0      auto      NMI
 10:       2089       mac      ADB
 14:        988       mac      timer
 19:        792       mac      ESP
 56:          0       mac      sonic
ERR:          0


diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 01e6b0e37f8d..aa3bdbaf2ff4 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -386,6 +386,9 @@ void via1_irq(struct irq_desc *desc)
 	int irq_num;
 	unsigned char irq_bit, events;
 
+	if (irq_desc_get_irq(desc) == 6)
+		printk_once(KERN_INFO "%s: using remapped irq\n", __func__);
+
 	events = via1[vIFR] & via1[vIER] & 0x7F;
 	if (!events)
 		return;
