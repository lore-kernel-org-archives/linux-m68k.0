Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282013C8EF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714118247; cv=none; b=sfNf7fIWysownIc8ZPgoYVHIApGqgXfj3lzERo5RTv5+aKltSp2s7uzd7rKhve4qjJ+SUqDemQcl/XX9aoB47QDUvw/tLircEBwipC/XrMCBbenO6z4uULXRS1OdQQnjL6zvCZCBcft3v0u6JY21nwWtqU0oQQwkNir3xSE41oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714118247; c=relaxed/simple;
	bh=9UUw7OA1UOUVHutyZ3jLvAJmNfOQ2mOd23aFSnd2XsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SqGHXIaKC8QdyuAq3Gt7/QxB4dCYEywSRaDEZWw2AL+Sghog/Djdud28rmkmlGlLYl4QLA/RfWCnMWFDJhB6OgxqVSM3j3znHbWpWNSqm+k8kUyAe39TQ9/lgjx4sXwh6nsB/pag61qwvwn0GbiXwVI1AftBQ43lQGI2tqneFWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WPdpGjHc; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WPdpGjHc"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 754B51C00147;
	Fri, 26 Apr 2024 03:57:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 26 Apr 2024 03:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714118242; x=1714204642; bh=9fIYC3zkLgA2mmwAExOCDcstasWM
	6AH76swAXtTk6qE=; b=WPdpGjHc6tKJxgBTBNBw5gnvC3eiWpw8sBfz/09jYWkm
	pWt0LycDJQVBQ9WUl4Rg3KMxeZkuoqjRrbCdse+Id+xlYNxBz9tbz9YOJIMCiZSS
	qCIsJdVKXdkKtAJ7GnNc5ZP3HdZ44bt1ETYhrlVuqdOxg4e2EDt5q1Bgohr0acFf
	zqJexpaXtZVkEs3l4I09M73eZV4uIfi2l1FR8fFchDv0czVz+NPQC2xlA6n4EWps
	HUyakjYfPopbJDATYggFA1JaJXfjunjl54SrsXPogFNljN+GD5nbAVXfkFZ+fA4T
	2Ux2FY4ClnZAoNLGhSNuCtk5gFjxfRg5XJ8TvuODwQ==
X-ME-Sender: <xms:Yl4rZoZEEnMoMx7Ajh53ut9fud7o8k2Rzopmxa9gi05Cmy5KW81sWQ>
    <xme:Yl4rZjat1Q--9ltB2uK59UJUNlD9O_MOxzweDCvQLBRfF4olmFMVVT_G4rasZ5TMt
    Y3XUtObuCv2MRfr-dE>
X-ME-Received: <xmr:Yl4rZi-cwTBl92xSfBCDv6Ew0reuZWvSvC3qSnjZh29btWUq3gFoev7HxzKmnDxBcik51IVFwbr-MDPvnSRXzmuiVDwNcRuOmh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelkedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Yl4rZiom-bb7XnA7a8PpkG0MjzJDE75Nx5-Joyj9cblHHcqCTLn1tg>
    <xmx:Yl4rZjrAWpcMIot2u6hTYXTeZTliKbQGXki99rkCdwd0LKRQ0Qnzyw>
    <xmx:Yl4rZgSRtvwGxYM62b_oz3tKyoJZlZqbm87brn6cZBhH63TD4aok1A>
    <xmx:Yl4rZjroUjoAl1OCllr6oKN9PIqB4mLMPXisrbzOzK1JYB1iOTitsA>
    <xmx:Yl4rZq3aQ2up1f_77f1KGlJD-d6x_xnVp7OcBiex31i7_s3c1HAB4ng9>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 03:57:19 -0400 (EDT)
Date: Fri, 26 Apr 2024 17:57:37 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
In-Reply-To: <fbaaf75c-c4e9-7fee-bb8d-9fd0fd25b197@gmail.com>
Message-ID: <47b70044-a1d0-8a06-d17e-229c613aaeea@linux-m68k.org>
References: <20240422022943.13775-1-schmitzmic@gmail.com> <20240422022943.13775-2-schmitzmic@gmail.com> <6fbf4809-dec2-84b9-3b83-86084ed19a20@linux-m68k.org> <57b70e03-2672-4f27-87f9-481208173a20@gmail.com> <b9d281db-c06e-0eb3-0f49-b95f576a9891@linux-m68k.org>
 <1b49c8a1-c753-428d-b526-06b6eb3e551c@gmail.com> <fbaaf75c-c4e9-7fee-bb8d-9fd0fd25b197@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Fri, 26 Apr 2024, Michael Schmitz wrote:

> Similar tests with start address five or six bytes before the start of 
> the unmapped page, and corresponding path length to be returned by 
> getcwd have shown no more Oops on 030 using the attached corrected 
> version of my patch.
> 
> Please give that some testing if you can, and (hoping it won't show any 
> new faults on 040) I'll post another version of the series with your 
> Tested-by added.
> 

I will test it tomorrow. I expect that a NOP is needed at the end of 
__clear_user.

BTW, since you're changing this line, I think there should be a tab here 
rather than two spaces:

+               "11:    "MOVES".b  %3,(%2)+\n"

