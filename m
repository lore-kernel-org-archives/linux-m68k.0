From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 04/14] nubus: Fix log spam
Date: Sat, 11 Nov 2017 07:04:09 -0800
Message-ID: <1510412649.10883.12.camel@perches.com>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
         <0c2f94698a76d320786aac770d2db006fd4e5764.1510377368.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0c2f94698a76d320786aac770d2db006fd4e5764.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Sat, 2017-11-11 at 01:12 -0500, Finn Thain wrote:
> Testing shows that a single Radius PrecisionColor 24X display board,
> which has 95 functional resources, produces over a thousand lines of
> log messages. Suppress these messages with pr_debug().
> Remove some redundant messages relating to nubus_get_subdir() calls.
> Fix the format block debug messages which has the sequence of entries
> backwards (my bad).
> Move the "Scanning slots" message to its proper location.

pr_debug calls are compiled completely away to nothing
unless DEBUG is
defined or CONFIG_DYNAMIC_DEBUG is
enabled.

Aren't some of these actually useful?

Perhaps it'd be nicer to have some nubus
specific flag to enable these outputs instead
of relying on either #define DEBUG or
CONFIG_DYNAMIC_DEBUG?
