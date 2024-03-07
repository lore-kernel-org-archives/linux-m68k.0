Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106AF1D698
	for <linux-m68k@lists.linux-m68k.org>; Thu,  7 Mar 2024 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709854469; cv=none; b=h1IWQ14TXbvfFWAOSsToIxyErXpb1I+yGs0L795wf2MhmV+oRALsu5KPK30QIQ0JDwpx0V6tTc/oU+gKMhb0vk8M+GoZ0hxhpEOcyA4QBYl9Ps5dNO7h0EJCzXDVF4LHZubFwekce1/CX4jRUjDtVummTiUPji/mbMlVYsb7Zng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709854469; c=relaxed/simple;
	bh=MBLjhHRWNqreB6zIQDAcGLZa/021wRW+LCrDR65k6YA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SuwUh/E4ZwxmTojmPMQUicnUnEotSuK05dxzZmOkaPjrfwoUqDhW/3mGpg3c9pQwQoTNfP3++ScnIhU8VbzvQMsb/qhMcTxCCDumxBRapxk8bnTFLgMygN9vNN6HetcDQiTHAtdaRHUoXeKEYym3vz9QTDChqRjuwBWZd6kh8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K8I4fc4k; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K8I4fc4k"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id DECC3138017D;
	Thu,  7 Mar 2024 18:34:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 07 Mar 2024 18:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709854465; x=1709940865; bh=uVDF0LnPN9K4yr0AnC4KZE+XQKrd
	WrQ3RXORTCpluIg=; b=K8I4fc4kZ0u8N6OEalICJQV3LItoMTy2tJTqdJghEqTj
	nahnhoEy9fk37HllQawV2tVmYWXt/PEgDkttyix5dCJdm4jcOwW4Uxdu56vd/M0o
	vOPTbcdiA5FNp3wtZ1td4FgvYqX5Fv/cC5BJqC0AJpLKYyLL91zSvEpX1Yeu+sOU
	IVZYqplZ5q8fTEIhqSdtqY+S84OanJdVJ27U4oR7JyksyL5QciRJZ0/n2I+gfzAd
	YsSI1JDy8/L7HsnxMS6O0RTcGzakVWZ59RX9jJwQ+9l3wGaMI1AWLwXsRM2a9jop
	rfyw5712D6zWaaC5wPWyYZnDueRqk2z6l3dsyIuhqg==
X-ME-Sender: <xms:AU_qZUlSCP2hSBzW_qZwqj1FWWkokOAyR2yNHfp2hujGIOEObgHlKw>
    <xme:AU_qZT27uqd6Y-tTaOq2wPaLI2ddASdSGrLKA7RBA2W6ozypzlfBHpTgP3okEiV1u
    puHTUNFUoyaw7lWS6c>
X-ME-Received: <xmr:AU_qZSrfVqjt5Jgj5Z8U6Rqv1ZtCdABydQvV0kalrkujGkNj_ePzB1nbYC3aTkZ2eYlD0yM4CgXl2R9Ny5VWCL6_wbuyjc-U9Yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrieeggdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueeh
    ueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:AU_qZQktGCVJ5leBq7lHc34cg8zx8WBaiSsWiwRl5hSMcBuELTevlA>
    <xmx:AU_qZS0HURLiIn8iqv1yrswvhHfuJLj8Mk24lUoQg5-yoB2S3NjaKA>
    <xmx:AU_qZXsYVb0smk0GYnVqZdNV5TTyvafEqNeL19_91bSip7ZQ46O6mw>
    <xmx:AU_qZVRGJadC14Aep7oSuAn85140FCGMK8_wOCqSXsA1WgN362IRCQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Mar 2024 18:34:22 -0500 (EST)
Date: Fri, 8 Mar 2024 10:35:00 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Guenter Roeck <linux@roeck-us.net>
cc: Brad Boyer <flar@allandria.com>, Michael Schmitz <schmitzmic@gmail.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: spinlock recursion when running q800 emulation in qemu
In-Reply-To: <2e1bd0cb-aaf5-4b52-a784-081dcfe65e1a@roeck-us.net>
Message-ID: <30955976-dd4e-be60-b5f4-87e13fe3ea20@linux-m68k.org>
References: <07811b26-677c-4d05-aeb4-996cd880b789@roeck-us.net> <0ccf5e42-63ec-a63d-9ee9-7043947637c3@gmail.com> <20240306083054.GA20607@allandria.com> <212aa3c7-0706-f3f6-5bfd-c8146e5192e6@linux-m68k.org>
 <2e1bd0cb-aaf5-4b52-a784-081dcfe65e1a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 6 Mar 2024, Guenter Roeck wrote:

> 
> Does that mean we just have to live with the warning, or is there a 
> possible solution ?
> 

I wasn't able to reproduce the problem and I don't know what the root 
cause is. That cause may be unrelated to the timer interrupt.
