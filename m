Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0292342A9B
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Apr 2024 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714118304; cv=none; b=UsvVN6COqnOivRwKjkdxeygGrkPOLOMYzhARVADzwBhFMHRr7HPLpGtVjNzp8RQmWLxJamLjk7bg47xmVOVdj3R+uysuHUgsIDIi8llGGq6I42EUArJoGbbXaM9hBj6PbQKowlUiAvWNBMPFRi3cLMH3E+DXcfPDm88NDnIgkfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714118304; c=relaxed/simple;
	bh=9UUw7OA1UOUVHutyZ3jLvAJmNfOQ2mOd23aFSnd2XsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ekm4ltvic9kK11PGxGjMxSkDZKfelcO291rFV7D9C+ns36t5XPZhCwbso8XZvgTke1OUAQ2ceBgtm9VqxZ7dln9we6jmEY3QHix+ssTr6BvGgYtLfpAS2WtSW4w7UQmDnaQT3qFxjMNiRD1pKt8+PuGSzaCN3T33JYR59j9G+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RifDCVI6; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RifDCVI6"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id C171E1C0013A;
	Fri, 26 Apr 2024 03:58:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 26 Apr 2024 03:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714118300; x=1714204700; bh=9fIYC3zkLgA2mmwAExOCDcstasWM
	6AH76swAXtTk6qE=; b=RifDCVI6SIdYqZp0x8oZdE9Nw8xPOvLLWrP1wrIjdcw4
	84CJOqHz41eNlFs+bvOsepBqexotJM0Ysj5hwYQbDw7NxyZ2o3ZquQj+Qz44ZwBO
	kraZadUC7tx9AIIL27E7geK0c4F4BWIp+i/lEi4BZfYL3HTv1Ay+RcASBeHkZZtv
	habXu8j+XspMRlKpi+Jjl+sbmuvbogSuJERCIXBrGRvBHUBDGD6INC51L5lOXKRR
	VEH1p6p7nPA1VyfCIIUKIeafFVcQl7rjz/OZz7qEzNnvbtMETlZRBUHC1sFIUtoL
	DGw5FwwvDcLMMoNCOuRvIB2FWfNmcrZSQZvACX7ENQ==
X-ME-Sender: <xms:m14rZjylwdsVe1K9Ojbq45lJQmwBU5_Zz7lGEPnjnfowqfSlFaALpw>
    <xme:m14rZrReLS-Xb2T8TISKZEMREcOKeTkEq32rLLfEIHO0bRiwfnZnT3eDbe54JefE9
    VejSx8KEFN3VANbICU>
X-ME-Received: <xmr:m14rZtVitzYL6m3dh5TVjtgR9a1ETpL5RW9osuDnuBlqWfA-mAB8tCuVd7EJIjkEBV4MUZrWjlXxSb8AJB0UDft6VO_BA8dYzWc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelkedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
    ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
    grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
    ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:m14rZtjeHyaXtgW4pUso6hQLqY91m0vyTN-LR6AcEs1ednh1ukHzCg>
    <xmx:m14rZlC2K9l-cOdWXhXObPoM55FpmbdtcvzxEwZ0FrbWmBsKmlWeQA>
    <xmx:m14rZmIcD7CYknTaOeWUfo7GYT5FRNHMZ9kS9U8kwBRHnXYr2j0mCQ>
    <xmx:m14rZkCz5CK8UBKtZ4aujRRixBShpAAZsLdVlivmoJ5L4wYOXqy9Ww>
    <xmx:nF4rZoM9Oev8JBu8afjNOkctNVyW3kkxfw8_HJs6gt3j8fCUV44tzXDa>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 03:58:18 -0400 (EDT)
Date: Fri, 26 Apr 2024 17:58:38 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH RFC v2 1/2] m68k: Handle __generic_copy_to_user faults
 more carefully
In-Reply-To: <fbaaf75c-c4e9-7fee-bb8d-9fd0fd25b197@gmail.com>
Message-ID: <ef3430ab-4dbb-954b-8bc3-7abf046d134c@linux-m68k.org>
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

