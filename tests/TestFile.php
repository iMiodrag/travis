<?php
use PHPUnit\Framework\TestCase;

class TestFile extends TestCase
{
    public function testTotalNumberOfFruits()
    {
	$fruits = ['orange', 'apple'];
        $this->assertEquals(2, count($fruits));
    }
}
?>
